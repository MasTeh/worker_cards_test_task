import 'package:worker_card/module/workers/domain/entity/user.dart';

abstract interface class UsersDataSource {
  Future<List<User>> getUsers();  
}