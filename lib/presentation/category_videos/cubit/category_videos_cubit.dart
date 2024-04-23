import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import '../../../data/datasources/remote/dtos/category_videos_response_dto.dart';
import '../../../data/datasources/remote/dtos/video_data_response_dto.dart';
import '../../../data/repositories/category_videos_repository.dart';

part 'category_videos_state.dart';

class CategoryVideosCubit extends Cubit<CategoryVideosState> {
  CategoryVideosCubit({
    required this.categoryVideosRepository,
  }) : super(const CategoryVideosState());

  final CategoryVideosRepository categoryVideosRepository;

  Future<void> getCategoryVideos(String url) async {
    emit(state.copyWith(status: CategoryVideosStatus.loading));
    try {
      final CategoryVideosResponseDto categoryVideosResponseDto =
          await categoryVideosRepository.getCategoryVideos(url);
      final Logger logger = Logger();
      for (final VideoDataResponseDto element
          in categoryVideosResponseDto.data) {
        logger.i(element.toString());
      }
      emit(state.copyWith(
          status: CategoryVideosStatus.success,
          videos: categoryVideosResponseDto.data));
    } catch (e) {
      emit(state.copyWith(status: CategoryVideosStatus.error));
    }
  }
}
