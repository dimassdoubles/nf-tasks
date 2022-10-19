import 'package:flutter/material.dart';
import 'package:nf_tasks/share/routes.dart';

import '../../domain/entity/task.dart';

class NotificationPage extends StatelessWidget {
  final List<Task> _listTask;
  const NotificationPage({
    super.key,
    required List<Task> listTask,
  }) : _listTask = listTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pushNamed(context, homePage);
          },
        ),
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: _listTask.length,
        itemBuilder: (context, index) => Text(_listTask[index].title),
      ),
    );
  }
}
