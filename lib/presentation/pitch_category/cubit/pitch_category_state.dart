part of 'pitch_category_cubit.dart';

enum PictCategoryStatus {
  loading,
  success,
  error,
}

class PitchCategoryState extends Equatable {
  const PitchCategoryState({
    this.status = PictCategoryStatus.loading,
    this.videos = const <VideoDataResponseDto>[],
  });

  final PictCategoryStatus status;
  final List<VideoDataResponseDto> videos;

  PitchCategoryState copyWith({
    PictCategoryStatus? status,
    List<VideoDataResponseDto>? videos,
  }) {
    return PitchCategoryState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
    );
  }

  @override
  List<Object?> get props => <Object?>[status, videos];
}
