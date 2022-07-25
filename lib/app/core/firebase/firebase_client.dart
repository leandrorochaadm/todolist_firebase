abstract class FirebaseClient {
  Future<Map<String, dynamic>> get({
    required String path,
  });
}
