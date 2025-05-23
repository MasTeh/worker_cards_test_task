import 'package:worker_card/module/workers/domain/entity/user.dart';

abstract interface class LoadUserListUsecase {
  Future<List<User>> call();
}