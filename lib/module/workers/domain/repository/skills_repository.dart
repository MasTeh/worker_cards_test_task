import 'package:worker_card/module/workers/domain/entity/skill.dart';

abstract interface class SkillsRepository {
  Future<Set<Skill>> getSkills(String userId);
}