import 'package:worker_card/module/workers/domain/entity/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.avatar,
    required super.location,
  });
}
