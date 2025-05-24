import 'dart:async';
import 'dart:math';
import 'package:worker_card/module/workers/domain/data_source/user_available_data_source.dart';
import 'package:worker_card/module/workers/domain/enum/available.dart';

class MockUserAvailableDataSource implements UserAvailableDataSource {
  @override
  FutureOr<AvailableStatus> isUserAvailable(String userId) {
    
    return Random().nextBool()
        ? AvailableStatus.available
        : AvailableStatus.unavailable;
  }
}