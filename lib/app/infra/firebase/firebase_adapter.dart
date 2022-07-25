import '../../core/firebase/firebase.dart';
import 'firebase.dart';

export 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;

class FirebaseAdapter implements FirebaseClient {
  FirebaseFirestore fireStoreClient;

  FirebaseAdapter({required this.fireStoreClient});

  @override
  Future<Map<String, dynamic>> get({required String path}) async {
    try {
      final docReference = fireStoreClient.doc(path);
      if (docReference == null) {
        throw FirebaseError.documentNotFound;
      }
      final docSnapshot = await docReference.get();
      return docSnapshot.data()!;
    } catch (e) {
      if (e is FirebaseError) {
        throw e;
      } else {
        throw FirebaseError.unexpected;
      }
    }
  }
}
