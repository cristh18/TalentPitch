import '../../../../domain/models/pitch_model.dart';
import '../dtos/pitch_dto.dart';

extension PitchDtoMapper on PitchDto {
  PitchModel toDomain() {
    return PitchModel(
        name: name,
        avatar: avatar,
        desiredRole: desiredRole,
        video: video,
        videoUrl: videoUrl);
  }
}
