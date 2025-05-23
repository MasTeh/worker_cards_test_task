import 'package:worker_card/module/workers/domain/entity/review.dart';

abstract interface class ReviewsRepository {
  Future<List<Review>> getReviews(String userId);
}