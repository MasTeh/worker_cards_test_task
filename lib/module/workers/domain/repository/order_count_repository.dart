import 'dart:async';

abstract interface class OrdersCountRepository {
  FutureOr<int> getOrdersCount(String userId);
}