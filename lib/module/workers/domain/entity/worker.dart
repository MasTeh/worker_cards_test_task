import 'package:worker_card/module/workers/domain/entity/review.dart';
import 'package:worker_card/module/workers/domain/entity/skill.dart';
import 'package:worker_card/module/workers/domain/enum/available.dart';

abstract interface class Worker {
  Set<Skill> get skills;
  List<Review> get reviews;
  AvailableStatus get status;
  int get ordersCount;
}
