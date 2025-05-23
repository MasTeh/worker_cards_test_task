import 'dart:async';
import 'package:worker_card/module/workers/domain/entity/skill.dart';

abstract interface class SkillsDataSource {
  FutureOr<Set<Skill>> getSkills(String userId); 
}