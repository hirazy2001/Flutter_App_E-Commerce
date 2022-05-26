class UserFacebookModel {
  final String? email;
  final int? id;
  final String? name;
  final PictureModel? pictureModel;

  const UserFacebookModel({this.email, this.id, this.name, this.pictureModel});

  factory UserFacebookModel.fromJson(Map<String, dynamic> json) =>
      UserFacebookModel(
        name: json["name"],
        id: json["id"],
        email: json["email"],
        pictureModel: PictureModel.fromJson(json["picture"]["data"])
      );
}

class PictureModel {
  final String? url;
  final int? width;
  final int? height;

  const PictureModel({this.width, this.height, this.url});

  factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
      width: json["width"], height: json["height"], url: json["url"]);
}
