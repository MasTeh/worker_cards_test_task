import 'package:worker_card/module/workers/domain/entity/review.dart';
import 'package:worker_card/module/workers/domain/entity/skill.dart';
import 'package:worker_card/module/workers/domain/entity/user.dart';
import 'package:worker_card/module/workers/domain/entity/worker.dart';
import 'package:worker_card/module/workers/domain/enum/available.dart';

class WorkerModel extends User implements Worker {
  @override
  final Set<Skill> skills;

  @override
  final AvailableStatus status;

  @override
  final List<Review> reviews;

  @override
  final int ordersCount;

  const WorkerModel({
    required this.skills,
    required this.status,
    required this.reviews,
    required this.ordersCount,
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.location,
    required super.avatar,
  });

  factory WorkerModel.fromUser({
    required User user,
    required Set<Skill> skills,
    required AvailableStatus status,
    required List<Review> reviews,
    required int ordersCount,
  }) {
    return WorkerModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      avatar: user.avatar,
      location: user.location,
      skills: skills,
      status: status,
      reviews: reviews,
      ordersCount: ordersCount,
    );
  }
}
