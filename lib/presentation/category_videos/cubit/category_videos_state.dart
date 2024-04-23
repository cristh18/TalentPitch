part of 'category_videos_cubit.dart';

enum CategoryVideosStatus {
  loading,
  success,
  error,
}

class CategoryVideosState extends Equatable {
  const CategoryVideosState({
    this.status = CategoryVideosStatus.loading,
    this.videos = const <VideoDataResponseDto>[],
  });

  final CategoryVideosStatus status;
  final List<VideoDataResponseDto> videos;

  CategoryVideosState copyWith({
    CategoryVideosStatus? status,
    List<VideoDataResponseDto>? videos,
  }) {
    return CategoryVideosState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
    );
  }

  @override
  List<Object?> get props => <Object?>[status, videos];
}
