class UserLocal {
  String id;
  String picture;
  String phone;
  String address;
  String createdAt;

  UserLocal(
      {required this.id,
      required this.picture,
      required this.phone,
      required this.address,
      required this.createdAt});

  factory UserLocal.fromJson(Map<String, dynamic> json) => UserLocal(
      phone: json["phone"],
      id: json["id"],
      address: json["address"],
      picture: json["picture"],
      createdAt: json["createdAt"]);
}

UserLocal defaultUser =
    UserLocal(id: '', phone: '', picture: '', createdAt: '', address: '');
