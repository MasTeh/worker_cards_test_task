import 'package:flutter/material.dart';
import 'package:worker_card/module/workers/data/model/worker.dart';
import 'package:worker_card/module/workers/domain/enum/available.dart';
import 'package:worker_card/module/workers/presenter/widget/animated_column.dart';
import 'package:worker_card/module/workers/presenter/widget/header_text.dart';
import 'package:worker_card/module/workers/presenter/widget/skill_item.dart';
import 'package:worker_card/module/workers/presenter/widget/star_rating.dart';

class WorkerDetails extends StatelessWidget {
  const WorkerDetails({super.key, required this.worker});

  final WorkerModel worker;

  @override
  Widget build(BuildContext context) {
    final double workerRate =
        worker.reviews.map((e) => e.rating).reduce((a, b) => a + b) /
        worker.reviews.length;

    return Scaffold(
      appBar: AppBar(title: Text("${worker.firstName} ${worker.lastName}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedColumn(
          children: [
            Row(
              children: [
                Hero(
                  tag: worker.id,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(worker.avatar.imageUrl),
                  ),
                ),
                const SizedBox(width: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,                      
                      children: [
                        Text(
                          "${worker.firstName} ${worker.lastName}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          worker.location,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        switch (worker.status) {
                          AvailableStatus.available => const Text(
                            "Available",
                            style: TextStyle(color: Colors.green),
                          ),
                          AvailableStatus.unavailable => const Text(
                            "Unavailable",
                            style: TextStyle(color: Colors.red),
                          ),
                          AvailableStatus.unknown => const SizedBox(),
                        },
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.phone_in_talk, color: Colors.green),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Not today 😜",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const HeaderText(title: "Skills"),
            const SizedBox(height: 8),
            for (final skill in worker.skills) SkillItem(skill: skill),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeaderText(title: "Rate"),
                Row(
                  children: [
                    StarRating(rating: workerRate),
                    const SizedBox(width: 8),
                    Text(
                      workerRate.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeaderText(title: "Works Finished"),
                Text(
                  "${worker.ordersCount}",
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
