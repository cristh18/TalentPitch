import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class TalentCategoriesDto {
  TalentCategoriesDto(
      {required this.title,
      required this.key,
      required this.url,
      required this.type,
      required this.image});

  factory TalentCategoriesDto.fromJson(Map<String, dynamic> json) {
    return TalentCategoriesDto(
        title: json['title'],
        key: json['key'],
        url: json['url'],
        type: json['type'],
        image: json['image']);
  }

  final String title;
  final String key;
  final String url;
  final String type;
  final String image;
}
