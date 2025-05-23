import 'dart:async';
import 'package:worker_card/module/workers/domain/entity/review.dart';

abstract interface class ReviewsDataSource {
  FutureOr<List<Review>> getReviews(String userId);
}