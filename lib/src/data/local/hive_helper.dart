import 'package:flutter_app_e_commerce/src/data/model/hive_model.dart';
import 'package:hive/hive.dart';

class HiveHelper{
  static Box<HiveModel> getTransactions() =>
      Hive.box<HiveModel>('hive_model');
}