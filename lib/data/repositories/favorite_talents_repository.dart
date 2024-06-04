import '../datasources/local/entities/playlist_entity.dart';
import '../datasources/local/entities/video_entity.dart';
import '../datasources/local/local_data_source.dart';

class FavoriteTalentsRepository {
  FavoriteTalentsRepository({required this.dataSource});

  final LocalDataSource dataSource;

  Future<void> saveVideo(PlaylistEntity playlist, VideoEntity video) async {
    await dataSource.saveVideo(playlist, video);
  }

  Future<List<VideoEntity>> getFavoriteTalents() async {
    return dataSource.getFavoriteTalents();
  }

  Future<int> removeFavoriteTalent(int videoId) async {
    return dataSource.removeFavoriteTalent(videoId);
  }
}
