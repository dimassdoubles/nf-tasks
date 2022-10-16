import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../share/styles/colors.dart';
import '../../share/styles/text_styles.dart';

class TaskProgress extends StatelessWidget {
  const TaskProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 4 / 2,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: tosca,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  tosca,
                  blue,
                  pink,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assignment Progress',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 16,
                        color: black,
                        fontWeight: bold,
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '3 / 15 is completed',
                  style: TextStyle(
                    color: black,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: LinearPercentIndicator(
                            percent: 0.68,
                            backgroundColor: gray,
                            progressColor: black,
                            lineHeight: 15,
                            barRadius: const Radius.circular(25),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '68 %',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
