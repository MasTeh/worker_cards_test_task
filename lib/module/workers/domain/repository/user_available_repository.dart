import 'dart:async';
import 'package:worker_card/module/workers/domain/enum/available.dart';

abstract interface class UserAvailableRepository {
  FutureOr<AvailableStatus> isUserAvailable(String userId);
}