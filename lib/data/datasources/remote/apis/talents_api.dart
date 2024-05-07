import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/talents_dto.dart';

part 'talents_api.g.dart';

@RestApi()
abstract class TalentsApi {
  factory TalentsApi(Dio dio) = _TalentsApi;

  @GET('/api/homeservice/categories/all/12')
  Future<TalentsDto> getTalents();
}
