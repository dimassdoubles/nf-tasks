import 'package:flutter/material.dart';
import '../../share/styles/colors.dart';
import '../../share/routes.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: _listTask.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(
                        15,
                      ),
                      color: blue.withOpacity(0.5),
                    ),
                    child: Text(
                      _listTask[index].title,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
