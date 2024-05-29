import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/local/local_data_source.dart';
import '../data/datasources/remote/apis/talent_category_detail_api.dart';
import '../data/datasources/remote/apis/talents_api.dart';
import '../data/repositories/favorite_talents_repository.dart';
import '../data/repositories/talent_category_detail_repository.dart';
import '../data/repositories/talents_repository.dart';
import '../network/http_dio_manager.dart';
import '../network/interceptors/base_url_interceptor.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BaseUrlInterceptor());

  _registerDios();
  _registerApis();
  _registerDatasources();
  _registerRepositories();
}

void _registerDios() {
  locator.registerLazySingleton(
      () => HttpDioManager(interceptors: <InterceptorsWrapper>[]),
      instanceName: 'TalentPitchHttpDioManager');

  locator.registerLazySingleton(
      () => HttpDioManager(
          interceptors: <InterceptorsWrapper>[locator<BaseUrlInterceptor>()]),
      instanceName: 'CategoryVideosHttpDioManager');
}

void _registerApis() {
  locator.registerLazySingleton(() => TalentsApi(
      locator<HttpDioManager>(instanceName: 'TalentPitchHttpDioManager').dio));

  locator.registerLazySingleton(() => TalentCategoryDetailApi(
      locator<HttpDioManager>(instanceName: 'CategoryVideosHttpDioManager')
          .dio));
}

void _registerDatasources() {
  locator.registerLazySingleton(() => LocalDataSource());
}

void _registerRepositories() {
  locator.registerLazySingleton(
      () => TalentsRepository(talentPitchApi: locator<TalentsApi>()));

  locator.registerLazySingleton(() => TalentCategoryDetailRepository(
      talentCategoryDetailApi: locator<TalentCategoryDetailApi>()));

  locator.registerLazySingleton(
      () => FavoriteTalentsRepository(dataSource: locator<LocalDataSource>()));
}
