import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserTask extends Equatable{
  final String _taskId;
  bool _isCompleted, _isNew;

  UserTask({
    required String taskId,
    bool isCompleted = false,
    bool isNew = true,
  })  : _taskId = taskId,
        _isNew = isNew,
        _isCompleted = isCompleted;

  String get taskid {
    return _taskId;
  }

  bool get isCompleted {
    return _isCompleted;
  }

  bool get isNew {
    return _isNew;
  }

  void completed() {
    _isCompleted = true;
  }

  void unCompleted() {
    _isCompleted = false;
  }

  void read() {
    _isNew = false;
  }
  
  @override
  List<Object?> get props => [_taskId, _isCompleted, _isNew];
}
