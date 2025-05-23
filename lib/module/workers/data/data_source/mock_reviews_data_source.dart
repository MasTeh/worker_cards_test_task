import 'dart:async';
import 'dart:math';
import 'package:worker_card/module/workers/data/model/worker_review.dart';
import 'package:worker_card/module/workers/domain/data_source/reviews_data_source.dart';
import 'package:worker_card/module/workers/domain/entity/review.dart';

class MockReviewsDataSource implements ReviewsDataSource {
  @override
  FutureOr<List<Review>> getReviews(String userId) {
    return [
      for (int i = 0; i < 10; i++)
        WorkerReview(
          id: 'review_$i',
          userId: userId,
          rating: Random().nextInt(5) + 1,
          createdAt: DateTime.now().subtract(Duration(days: i)),
        ),
    ];
  }
}
