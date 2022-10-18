import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entity/user_task.dart';

abstract class UserTaskRemoteDataSource {
  Future<List<UserTask>> getUserTasks({
    required String uid,
  });
  Future<void> updateUserTasks({
    required List<UserTask> listUserTasks,
    required String uid,
  });

  Future<void> initializeUserTasks({
    required String uid,
    required List<String> listTaskId,
  });
}

class FirestoreUserTaskDataSource extends UserTaskRemoteDataSource {
  final FirebaseFirestore _firestore;

  FirestoreUserTaskDataSource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;
  @override
  Future<List<UserTask>> getUserTasks({
    required String uid,
  }) async {
    CollectionReference collectionReference = _firestore.collection(uid);
    final result = await collectionReference.get();

    final listUserTask = result.docs
        .map(
          (e) => UserTask(
            taskId: e.get("task_id"),
            isCompleted: e.get("is_completed"),
            isNew: e.get("is_new"),
          ),
        )
        .toList();

    return listUserTask;
  }

  @override
  Future<void> updateUserTasks({
    required List<UserTask> listUserTasks,
    required String uid,
  }) async {
    WriteBatch batch = _firestore.batch();
    CollectionReference collectionReference = _firestore.collection(uid);
    for (var element in listUserTasks) {
      batch.set(collectionReference.doc(element.taskid), {
        "task_id": element.taskid,
        "is_completed": element.isCompleted,
        "is_new": element.isNew,
      });
    }

    await batch.commit();
  }

  @override
  Future<void> initializeUserTasks({
    required String uid,
    required List<String> listTaskId,
  }) async {
    WriteBatch batch = _firestore.batch();
    CollectionReference collectionReference = _firestore.collection(uid);
    for (var element in listTaskId) {
      batch.set(collectionReference.doc(element), {
        "task_id": element,
        "is_completed": false,
        "is_new": true,
      });
    }

    await batch.commit();
  }
}
