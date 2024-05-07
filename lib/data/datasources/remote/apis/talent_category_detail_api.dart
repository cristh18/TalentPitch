import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/talent_category_detail_dto.dart';

part 'talent_category_detail_api.g.dart';

@RestApi()
abstract class TalentCategoryDetailApi {
  factory TalentCategoryDetailApi(Dio dio) = _TalentCategoryDetailApi;

  @GET('{url}')
  Future<TalentCategoryDetailDto> getTalentCategoryDetail(@Path('url') String url);
}
