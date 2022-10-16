import 'package:flutter/material.dart';

import '../../share/styles/colors.dart';
import '../../share/styles/text_styles.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tasks',
              style: textStyle1.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: gray.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: gray,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Mini Project 1'),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: gray.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: gray,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Mini Project 2'),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: gray.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: gray,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Mini Project 3'),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: gray.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: gray,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Mini Project 4'),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Completed',
              style: textStyle1.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: gray.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: gray,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Mini Project 5'),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: gray.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: gray,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Mini Project 6'),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: gray.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: gray,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Mini Project 7'),
                ],
              ),
            ),
            const SizedBox(
              height: 64,
            ),
          ],
        ),
      ),
    );
  }
}

