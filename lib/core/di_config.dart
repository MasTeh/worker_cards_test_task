import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worker_card/module/workers/data/data_source/mock_orders_count_data_source.dart';
import 'package:worker_card/module/workers/data/data_source/mock_reviews_data_source.dart';
import 'package:worker_card/module/workers/data/data_source/mock_skills_data_source.dart';
import 'package:worker_card/module/workers/data/data_source/mock_user_available_data_source.dart';
import 'package:worker_card/module/workers/data/data_source/random_user_data_source.dart';
import 'package:worker_card/module/workers/data/repository/workers_repository.dart';
import 'package:worker_card/module/workers/usecase/load_workers_usecase.dart';
import 'package:worker_card/service/http_service.dart';

final _workersRepository = WorkersRepository(
  usersDataSource: RandomUserDataSource(HttpService()),
  skillsDataSource: MockSkillsDataSource(),
  reviewsDataSource: MockReviewsDataSource(),
  orderCountDataSource: MockOrdersCountDataSource(),
  userAvailableDataSource: MockUserAvailableDataSource(),
);

/// Стык между слоями Data - Presenter через UseCase
final loadWorkersUsecaseProvider = Provider<LoadWorkersUsecase>(
  (ref) => LoadWorkersUsecase(_workersRepository),
);
