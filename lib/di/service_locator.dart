import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/remote/apis/talent_pitch_api.dart';
import '../data/repositories/pitch_repository.dart';
import '../network/http_dio_manager.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(
      () => HttpDioManager(interceptors: <InterceptorsWrapper>[]));
  locator.registerLazySingleton(() => PitchRepository(
      talentPitchApi: TalentPitchApi(locator<HttpDioManager>().dio)));
}
