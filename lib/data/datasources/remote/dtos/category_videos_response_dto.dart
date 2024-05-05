import 'video_data_response_dto.dart';

class CategoryVideosResponseDto {
  CategoryVideosResponseDto({
    required this.count,
    required this.data,
    required this.image,
    required this.key,
    required this.modelData,
    required this.title,
  });

  factory CategoryVideosResponseDto.fromJson(Map<String, dynamic> json) {
    return CategoryVideosResponseDto(
      count: json['count'] ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((dynamic e) =>
                  VideoDataResponseDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          <VideoDataResponseDto>[],
      image: json['image'] ?? '',
      key: json['key'] ?? '',
      modelData: json['model_data'] ?? '',
      title: json['title'] ?? '',
    );
  }

  final int count;
  final List<VideoDataResponseDto> data;
  final String image;
  final String key;
  final String modelData;
  final String title;
}
