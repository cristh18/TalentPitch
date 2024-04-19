import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'category_videos_api.g.dart';

@RestApi()
abstract class CategoryVideosApi {
  factory CategoryVideosApi(Dio dio) = _CategoryVideosApi;

  @GET('{url}')
  Future<Object> getCategoryVideos(@Path('url') String url);
}
