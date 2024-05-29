import '../datasources/local/entities/playlist_entity.dart';
import '../datasources/local/entities/video_entity.dart';
import '../datasources/local/local_data_source.dart';

class FavoriteTalentsRepository{

  FavoriteTalentsRepository({required this.dataSource});

  final LocalDataSource dataSource;

  Future<void> saveVideo(PlaylistEntity playlist, VideoEntity video) async {
    await dataSource.saveVideo(playlist, video);
  }

  // Future<List<Talent>> getFavoriteTalents() async {
  //   return _dataSource.getFavoriteTalents();
  // }

  // Future<void> addFavoriteTalent(Talent talent) async {
  //   return _dataSource.addFavoriteTalent(talent);
  // }

  // Future<void> removeFavoriteTalent(Talent talent) async {
  //   return _dataSource.removeFavoriteTalent(talent);
  // }
}
