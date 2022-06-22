class Resource {
  String id;
  String key;
  TYPE_RESOURCES type;

  Resource({required this.id, required this.key, required this.type});

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
      id: json["id"],
      key: json["key"],
      type: typeResource.map[json["type"]] ?? TYPE_RESOURCES.IMAGE);
}

enum TYPE_RESOURCES { IMAGE, AUDIO, VIDEO }

final typeResource = EnumValues({
  "image": TYPE_RESOURCES.IMAGE,
  "audio": TYPE_RESOURCES.AUDIO,
  "video": TYPE_RESOURCES.VIDEO
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
