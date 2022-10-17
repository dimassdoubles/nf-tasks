import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entity/task.dart';

abstract class TaskRemoteDataSource {
  Future<List<Task>> getTasks();
}

class FirestoreTaskDataSource extends TaskRemoteDataSource {
  static const collectionName = "tasks";

  final FirebaseFirestore _firestore;

  FirestoreTaskDataSource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<List<Task>> getTasks() async {
    CollectionReference collectionReference =
        _firestore.collection(collectionName);
    final result = await collectionReference.get();

    final listTask = result.docs
        .map(
          (e) => Task(
            id: e.get("id"),
            deadline: e.get("deadline"),
            description: e.get("description"),
            title: e.get("title"),
            type: e.get("type"),
          ),
        )
        .toList();
        
    return listTask;
  }
}
