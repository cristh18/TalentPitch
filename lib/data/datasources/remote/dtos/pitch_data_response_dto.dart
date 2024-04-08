import 'package:json_annotation/json_annotation.dart';

import 'pitch_response_dto.dart';

@JsonSerializable(explicitToJson: true)
class PitchDataResponseDto {
  PitchDataResponseDto({required this.data});

  factory PitchDataResponseDto.fromJson(Map<String, dynamic> json) {
    final List<PitchResponseDto> data = (json['data'] as List<dynamic>)
        .map((dynamic e) => PitchResponseDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return PitchDataResponseDto(data: data);
  }
  
  final List<PitchResponseDto> data;
}
