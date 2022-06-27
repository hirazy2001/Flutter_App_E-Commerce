import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

// part 'hive_model.freezed.dart';

@HiveType(typeId: 0)
class HiveModel extends HiveObject{

  @HiveField(0)
  final String name;

  HiveModel({required this.name});
}