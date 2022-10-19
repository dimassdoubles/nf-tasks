import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'task_progress_card.dart';

class TaskProgress extends StatefulWidget {
  const TaskProgress({super.key});

  @override
  State<TaskProgress> createState() => _TaskProgressState();
}

class _TaskProgressState extends State<TaskProgress> {
  final List<String> typeList = ["assignment", "quiz"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 4 / 2,
        child: Swiper(
          itemCount: 2,
          itemBuilder: (context, index) => TaskProgressCard(
            type: typeList[index],
          ),
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: MediaQuery.of(context).size.width / 2,
          layout: SwiperLayout.TINDER,
        ),
      ),
    );
  }
}
