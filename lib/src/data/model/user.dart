class User {
  String id;
  String picture;
  String phone;
  String createdAt;


  User(
      {required this.id,
      required this.picture,
      required this.phone,
      required this.createdAt});

  factory User.fromJson(Map<String, dynamic> json) => User(
    phone: json["phone"],
    id: json["id"],
    picture: json["picture"],
    createdAt: json["createdAt"]
  );
}
