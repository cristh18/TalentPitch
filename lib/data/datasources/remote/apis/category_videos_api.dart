import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/category_videos_response_dto.dart';

part 'category_videos_api.g.dart';

@RestApi()
abstract class CategoryVideosApi {
  factory CategoryVideosApi(Dio dio) = _CategoryVideosApi;

  @GET('{url}')
  Future<CategoryVideosResponseDto> getCategoryVideos(@Path('url') String url);
}
