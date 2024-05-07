import 'package:json_annotation/json_annotation.dart';

import 'talent_categories_dto.dart';

@JsonSerializable(explicitToJson: true)
class TalentsDto {
  TalentsDto({required this.data});

  factory TalentsDto.fromJson(Map<String, dynamic> json) {
    final List<TalentCategoriesDto> data = (json['data'] as List<dynamic>)
        .map((dynamic e) => TalentCategoriesDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return TalentsDto(data: data);
  }
  
  final List<TalentCategoriesDto> data;
}
