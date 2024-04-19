import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/remote/apis/category_videos_api.dart';
import '../data/datasources/remote/apis/talent_pitch_api.dart';
import '../data/repositories/category_videos_repository.dart';
import '../data/repositories/pitch_repository.dart';
import '../network/http_dio_manager.dart';
import '../network/interceptors/base_url_interceptor.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BaseUrlInterceptor());

  _registerDios();
  _registerApis();
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
  locator.registerLazySingleton(() => TalentPitchApi(
      locator<HttpDioManager>(instanceName: 'TalentPitchHttpDioManager').dio));

  locator.registerLazySingleton(() => CategoryVideosApi(
      locator<HttpDioManager>(instanceName: 'CategoryVideosHttpDioManager')
          .dio));
}

void _registerRepositories() {
  locator.registerLazySingleton(
      () => PitchRepository(talentPitchApi: locator<TalentPitchApi>()));

  locator.registerLazySingleton(() => CategoryVideosRepository(
      categoryVideosApi: locator<CategoryVideosApi>()));
}
