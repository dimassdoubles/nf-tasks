// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'task.dart';
import 'user_task.dart';

class AppTask extends Equatable {
  final Task _task;
  UserTask userTask;
  AppTask({
    required Task task,
    required this.userTask,
  }) : _task = task;

  Task get task {
    return _task;
  }

  @override
  List<Object?> get props => [_task, userTask];
}
