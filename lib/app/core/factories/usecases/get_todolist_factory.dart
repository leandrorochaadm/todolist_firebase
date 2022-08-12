import '../../../data/usecases/firebase/firebase_get_todolist.dart';
import '../../../domain/usecases/get_todolist.dart';
import '../../../infra/firebase/firebase.dart';

GetTodolist makeGetTodolistFactory() => FirebaseGetTodolist(
      firebaseClient: FirebaseAdapter(
        fireStoreClient: FirebaseFirestore.instance,
      ),
    );
