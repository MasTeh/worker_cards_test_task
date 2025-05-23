import 'package:worker_card/module/workers/data/mapper/user_json_mapper.dart';
import 'package:worker_card/module/workers/domain/data_source/users_data_source.dart';
import 'package:worker_card/module/workers/domain/entity/user.dart';
import 'package:worker_card/service/http_service.dart';

class RandomUserDataSource implements UsersDataSource {
  final HttpService httpService;

  const RandomUserDataSource(this.httpService);

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await httpService.client.get(
        'https://randomuser.me/api/?nat=us&results=50&inc=name,picture,login,location',
      );

      if (response.statusCode == 200) {
        final data = response.data['results'] as List<dynamic>;
        final users =
            data.map((user) {
              return UserJsonMapper.fromJson(user as Map<String, dynamic>);
            }).toList();
            
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (err) {
      rethrow;
    }
  }
}
