import 'dart:async';
import 'package:worker_card/module/workers/domain/enum/available.dart';

abstract interface class UserAvailableDataSource {
  FutureOr<AvailableStatus> isUserAvailable(String userId);
}