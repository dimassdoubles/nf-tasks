import 'package:flutter/material.dart';
import 'package:nf_tasks/share/styles/colors.dart';

import '../../share/styles/text_styles.dart';

class DetailTaskPage extends StatelessWidget {
  final String title, deadline, description;
  const DetailTaskPage({
    super.key,
    required this.title,
    required this.deadline,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: bold,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  50,
                ),
                color: blue.withOpacity(0.7),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                child: Text(
                  deadline,
                  style: TextStyle(
                    fontWeight: bold,
                    color: yellow,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              description,
              style: TextStyle(
                color: gray.withOpacity(
                  0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
