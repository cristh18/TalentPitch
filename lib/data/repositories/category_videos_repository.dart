import '../datasources/remote/apis/category_videos_api.dart';

class CategoryVideosRepository {
  CategoryVideosRepository({required this.categoryVideosApi});

  final CategoryVideosApi categoryVideosApi;

  Future<Object> getCategoryVideos(String url) {
    final String newUrl = url.replaceAll('https://data2.talentpitch.co', '/');
    return categoryVideosApi.getCategoryVideos(newUrl);
  }
}
