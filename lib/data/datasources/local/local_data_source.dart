import '../../../helpers/database_helper.dart';
import 'entities/playlist_entity.dart';
import 'entities/video_entity.dart';

class LocalDataSource {
  LocalDataSource();
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Future<void> saveVideo(PlaylistEntity playlist, VideoEntity video) async {
    final List<PlaylistEntity> playlists = await databaseHelper.getPlaylists();

    if (playlists.isNotEmpty &&
        playlists.first != null &&
        playlists.first.id == playlist.id) {
      await databaseHelper.insert('video', video.toMap());
    } else {
      await Future.wait(<Future<int>>[
        databaseHelper.insert('playlist', playlist.toMap()),
        databaseHelper.insert('video', video.toMap()),
      ]);
    }
  }

  Future<List<VideoEntity>> getFavoriteTalents() async {
    final List<VideoEntity> videos = <VideoEntity>[];
    final List<PlaylistEntity> playlists = await databaseHelper.getPlaylists();
    if (playlists.isEmpty) {
      return <VideoEntity>[];
    } else {
      for (final PlaylistEntity playlist in playlists) {
        final List<VideoEntity> playlistVideos =
            await databaseHelper.getVideosByPlaylistId(playlist.id);
        videos.addAll(playlistVideos);
      }
      return videos;
    }
  }

  Future<int> removeFavoriteTalent(VideoEntity video) async {
    return databaseHelper.delete('video', video.id);
  }
}
