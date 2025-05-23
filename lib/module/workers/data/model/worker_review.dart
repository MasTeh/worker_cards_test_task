import 'package:worker_card/module/workers/domain/entity/review.dart';

class WorkerReview extends Review {
  WorkerReview({
    required super.id,
    required super.userId,
    required super.rating,
    required super.createdAt,
  });
}
