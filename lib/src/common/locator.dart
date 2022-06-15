import 'package:flutter_app_e_commerce/src/data/remote/remote_data.dart';
import 'package:flutter_app_e_commerce/src/data/remote/remote_data_source.dart';
import 'package:get_it/get_it.dart';

import '../data/data_repository.dart';
import '../data/data_repository_impl.dart';
import '../data/local/preference.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton<Preference>(() => PreferenceImpl());
  locator.registerLazySingleton<DataRepository>(() => DataRepositoryImpl());
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteData());
}