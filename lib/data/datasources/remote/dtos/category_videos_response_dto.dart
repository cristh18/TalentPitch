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
      count: json['count'],
      data: List<VideoDataResponseDto>.from(
          json['data'].map((x) => VideoDataResponseDto.fromJson(x))),
      image: json['image'],
      key: json['key'],
      modelData: json['model_data'],
      title: json['title'],
    );
  }

  int count;
  List<VideoDataResponseDto> data;
  String image;
  String key;
  String modelData;
  String title;
}
