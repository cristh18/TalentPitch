import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
      await categoryVideosRepository.getCategoryVideos(url);
      emit(state.copyWith(
          status: CategoryVideosStatus.success,
          videos: <VideoDataResponseDto>[]));
    } catch (e) {
      emit(state.copyWith(status: CategoryVideosStatus.error));
    }
  }
}
