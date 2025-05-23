import 'dart:async';
import 'dart:math';
import 'package:worker_card/module/workers/domain/data_source/order_count_data_source.dart';

class MockOrdersCountDataSource implements OrderCountDataSource {
  @override
  FutureOr<int> getOrdersCount(String userId) {
    return Random().nextInt(100); 
  }
}