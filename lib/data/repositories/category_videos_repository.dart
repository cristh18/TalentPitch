import '../datasources/remote/apis/category_videos_api.dart';
import '../datasources/remote/dtos/category_videos_response_dto.dart';

class CategoryVideosRepository {
  CategoryVideosRepository({required this.categoryVideosApi});

  final CategoryVideosApi categoryVideosApi;

  Future<CategoryVideosResponseDto> getCategoryVideos(String url) {
    final String newUrl = url.replaceAll('https://data2.talentpitch.co', '/');
    return categoryVideosApi.getCategoryVideos(newUrl);
  }
}
