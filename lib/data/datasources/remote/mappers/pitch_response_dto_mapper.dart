import '../../../../domain/models/pitch_model.dart';
import '../dtos/pitch_response_dto.dart';

extension PitchResponseDtoMapper on PitchResponseDto {
  PitchModel toDomain() {
    return PitchModel(
        title: title, 
        key: key, 
        url: url, 
        type: type, 
        image: image);
  }
}
