import 'package:worker_card/module/workers/domain/entity/user.dart';

abstract interface class UsersRepository {
  Future<List<User>> getUsers();  
}