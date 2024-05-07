import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import '../../../data/datasources/remote/dtos/category_videos_response_dto.dart';
import '../../../data/datasources/remote/dtos/video_data_response_dto.dart';
import '../../../data/repositories/category_videos_repository.dart';

part 'pitch_category_state.dart';

class PitchCategoryCubit extends Cubit<PitchCategoryState> {
  PitchCategoryCubit({
    required this.categoryVideosRepository,
  }) : super(const PitchCategoryState());

  final CategoryVideosRepository categoryVideosRepository;

  Future<void> getCategoryVideos(String url) async {
    emit(state.copyWith(status: PictCategoryStatus.loading));
    try {
      final CategoryVideosResponseDto categoryVideosResponseDto =
          await categoryVideosRepository.getCategoryVideos(url);
      final Logger logger = Logger();
      for (final VideoDataResponseDto element
          in categoryVideosResponseDto.data) {
        logger.i(element.toString());
      }
      emit(state.copyWith(
          status: PictCategoryStatus.success,
          videos: categoryVideosResponseDto.data));
    } catch (e) {
      emit(state.copyWith(status: PictCategoryStatus.error));
    }
  }
}
