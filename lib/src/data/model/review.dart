class Review {
  String userName;
  String userId;

  //
  String picture;
  DateTime createdAt;
  String content;
  int rating;

  Review(
      {required this.userId,
      required this.userName,
      required this.createdAt,
      required this.rating,
      required this.content,
      required this.picture});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
      userId: json["userId"],
      userName: json["userName"],
      createdAt: json["createdAt"],
      rating: json["rating"],
      content: json["content"],
      picture: json["picture"]);
}
