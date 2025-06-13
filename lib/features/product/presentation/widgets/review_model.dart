class ReviewModel {
  final String userId;
  final String userName;
  final String? userAvatarUrl;
  final int rating; // from 1 to 5
  final String title;
  final String comment;
  final DateTime createdAt;
  final bool isVerifiedPurchase;

  ReviewModel({
    required this.userId,
    required this.userName,
    this.userAvatarUrl,
    required this.rating,
    required this.title,
    required this.comment,
    required this.createdAt,
    this.isVerifiedPurchase = false,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userId: json['userId'],
      userName: json['userName'],
      userAvatarUrl: json['userAvatarUrl'],
      rating: json['rating'],
      title: json['title'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
      isVerifiedPurchase: json['isVerifiedPurchase'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userAvatarUrl': userAvatarUrl,
      'rating': rating,
      'title': title,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
      'isVerifiedPurchase': isVerifiedPurchase,
    };
  }
}
