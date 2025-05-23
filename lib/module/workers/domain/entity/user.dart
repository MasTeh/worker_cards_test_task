import 'package:worker_card/module/workers/domain/entity/avatar.dart';

abstract class User {
  final String id;
  final String firstName;
  final String lastName;
  final String location;
  final Avatar avatar;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.avatar,    
  });
}
