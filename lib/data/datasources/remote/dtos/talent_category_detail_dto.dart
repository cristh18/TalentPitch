import 'pitch_dto.dart';

class TalentCategoryDetailDto {
  TalentCategoryDetailDto({
    required this.count,
    required this.data,
    required this.image,
    required this.key,
    required this.modelData,
    required this.title,
  });

  factory TalentCategoryDetailDto.fromJson(Map<String, dynamic> json) {
    return TalentCategoryDetailDto(
      count: json['count'] ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((dynamic e) =>
                  PitchDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          <PitchDto>[],
      image: json['image'] ?? '',
      key: json['key'] ?? '',
      modelData: json['model_data'] ?? '',
      title: json['title'] ?? '',
    );
  }

  final int count;
  final List<PitchDto> data;
  final String image;
  final String key;
  final String modelData;
  final String title;
}
