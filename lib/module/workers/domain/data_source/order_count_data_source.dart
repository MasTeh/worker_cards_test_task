import 'dart:async';

abstract interface class OrderCountDataSource {
  FutureOr<int> getOrdersCount(String userId);
}