import 'package:worker_card/module/workers/data/model/user.dart';
import 'package:worker_card/module/workers/data/model/user_avatar.dart';
import 'package:worker_card/module/workers/domain/entity/user.dart';
import 'package:worker_card/service/logger_service.dart';

final class UserJsonMapper {
  static User fromJson(Map<String, dynamic> json) {
    LoggerService.debug(json);
    final name = json['name'] as Map<String, dynamic>;
    final login = json['login'] as Map<String, dynamic>;
    final picture = json['picture'] as Map<String, dynamic>;
    final location = json['location'] as Map<String, dynamic>;
    final avatar = UserAvatar(imageUrl: picture['large']);

    return UserModel(
      id: login['uuid'] as String,
      firstName: name['first'] as String,
      lastName: name['last'] as String,
      location: '${location['city']}, ${location['country']}',
      avatar: avatar,
    );
  }
}