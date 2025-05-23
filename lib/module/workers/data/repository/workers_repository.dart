import 'dart:math';

import 'package:worker_card/module/workers/data/model/worker.dart';
import 'package:worker_card/module/workers/domain/data_source/order_count_data_source.dart';
import 'package:worker_card/module/workers/domain/data_source/reviews_data_source.dart';
import 'package:worker_card/module/workers/domain/data_source/skills_data_source.dart';
import 'package:worker_card/module/workers/domain/data_source/users_data_source.dart';
import 'package:worker_card/module/workers/domain/entity/review.dart';
import 'package:worker_card/module/workers/domain/entity/skill.dart';
import 'package:worker_card/module/workers/domain/enum/available.dart';
import 'package:worker_card/module/workers/domain/repository/reviews_repository.dart';
import 'package:worker_card/module/workers/domain/repository/skills_repository.dart';
import 'package:worker_card/module/workers/domain/repository/users_repository.dart';

/// [WorkersRepository] объединяет источники данных и делает сборку данных
/// по сути он ничего не знает о том, как эти данные получены
/// можно подключать разные реализации через внедрение зависимостей
class WorkersRepository
    implements UsersRepository, SkillsRepository, ReviewsRepository {
  final UsersDataSource usersDataSource;
  final SkillsDataSource skillsDataSource;
  final ReviewsDataSource reviewsDataSource;
  final OrderCountDataSource orderCountDataSource;

  const WorkersRepository({
    required this.usersDataSource,
    required this.skillsDataSource,
    required this.reviewsDataSource,
    required this.orderCountDataSource,
  });

  @override
  Future<List<WorkerModel>> getUsers() async {
    final users = await usersDataSource.getUsers();
    final List<WorkerModel> workers = [];
    for (final user in users) {
      final skills = await skillsDataSource.getSkills(user.id);
      final reviews = await reviewsDataSource.getReviews(user.id);      
      final ordersCount = await orderCountDataSource.getOrdersCount(user.id);
      final worker = WorkerModel.fromUser(
        user: user,
        skills: skills,
        status: Random().nextBool()
            ? AvailableStatus.available
            : AvailableStatus.unavailable,
        reviews: reviews,
        ordersCount: ordersCount,
      );
      workers.add(worker);
    }
    return workers;
  }

  @override
  Future<List<Review>> getReviews(String userId) async {
    return reviewsDataSource.getReviews(userId);
  }

  @override
  Future<Set<Skill>> getSkills(String userId) async {
    return skillsDataSource.getSkills(userId);
  }
}
