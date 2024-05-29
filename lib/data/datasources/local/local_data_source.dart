import '../../../helpers/database_helper.dart';
import 'entities/playlist_entity.dart';
import 'entities/video_entity.dart';

class LocalDataSource {

  LocalDataSource();
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Future<void> saveVideo(PlaylistEntity playlist, VideoEntity video) async {
    await Future.wait(<Future<int>>[
      databaseHelper.insert('playlist', playlist.toMap()),
      databaseHelper.insert('video', video.toMap()),
    ]);
  }
}
