import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import '../../../data/datasources/local/entities/playlist_entity.dart';
import '../../../data/datasources/local/entities/video_entity.dart';
import '../../../data/repositories/favorite_talents_repository.dart';
import '../../../domain/models/pitch_model.dart';

part 'pitch_detail_state.dart';

class PitchDetailCubit extends Cubit<PitchDetailState> {
  PitchDetailCubit({required this.favoriteTalentsRepository})
      : super(const PitchDetailState());

  final FavoriteTalentsRepository favoriteTalentsRepository;

  Future<void> saveVideo(PitchModel pitchModel) async {
    emit(state.copyWith(status: PitchDetailStatus.loading));
    final PlaylistEntity playlist = PlaylistEntity(
        id: 1,
        name: 'Favorite talents',
        description: 'My favorite talents',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    final VideoEntity video = VideoEntity(
        id: 1,
        playlistId: playlist.id,
        url: pitchModel.videoUrl,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    try {
      await favoriteTalentsRepository.saveVideo(playlist, video);
      final Logger logger = Logger();

      logger.i(
          'Video ${video.url} saved to playlist ${playlist.name} successfully.');

      emit(state.copyWith(status: PitchDetailStatus.success));
    } catch (e) {
      emit(state.copyWith(status: PitchDetailStatus.error));
    }
  }
}
