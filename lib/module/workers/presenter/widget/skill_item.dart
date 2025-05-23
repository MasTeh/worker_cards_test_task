import 'package:flutter/material.dart';
import 'package:worker_card/module/workers/domain/entity/skill.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({super.key, required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill.name,
            style: const TextStyle(fontSize: 16, color: Colors.blue),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              skill.description,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
