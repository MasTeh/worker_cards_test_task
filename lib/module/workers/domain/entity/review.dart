abstract class Review {
  final String id;
  final String userId;  
  final int rating;
  final DateTime createdAt;

  const Review({
    required this.id,
    required this.userId,
    required this.rating,
    required this.createdAt,
  });
}