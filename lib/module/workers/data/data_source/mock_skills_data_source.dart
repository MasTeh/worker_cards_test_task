import 'dart:async';
import 'dart:math';
import 'package:worker_card/module/workers/data/model/worker_skill.dart';
import 'package:worker_card/module/workers/domain/data_source/skills_data_source.dart';
import 'package:worker_card/module/workers/domain/entity/skill.dart';

class MockSkillsDataSource implements SkillsDataSource {
  @override
  FutureOr<Set<Skill>> getSkills(String userId) {
    return {
      for (var i = 0; i < 5; i++)
        mockSkills[Random().nextInt(mockSkills.length)],
    };
  }

  final List<Skill> mockSkills = [
    WorkerSkill(
      name: 'Carpentry',
      description: 'Expert in woodwork and furniture making.',
      level: 5,
    ),
    WorkerSkill(
      name: 'Plumbing',
      description: 'Skilled in pipe installation and repair.',
      level: 4,
    ),
    WorkerSkill(
      name: 'Electrical',
      description: 'Experienced in electrical wiring and repairs.',
      level: 3,
    ),
    WorkerSkill(
      name: 'Masonry',
      description: 'Proficient in brick and stone work.',
      level: 4,
    ),
    WorkerSkill(
      name: 'Welding',
      description: 'Skilled in metal joining and fabrication.',
      level: 5,
    ),
    WorkerSkill(
      name: 'Painting',
      description: 'Expert in interior and exterior painting.',
      level: 4,
    ),
    WorkerSkill(
      name: 'Roofing',
      description: 'Experienced in roof installation and repair.',
      level: 3,
    ),
  ];
}
