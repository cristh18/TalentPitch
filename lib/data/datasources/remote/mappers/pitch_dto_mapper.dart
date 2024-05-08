import '../../../../domain/models/pitch_model.dart';
import '../dtos/pitch_dto.dart';

extension PitchDtoMapper on PitchDto {
  PitchModel toDomain() {
    return PitchModel(
        name: name,
        avatar: avatar,
        desiredRole: desiredRole,
        country: country,
        city: city,
        knowledges: knowledges,
        skills: skills,
        resumeDescription: resumeDescription,
        video: video,
        videoUrl: videoUrl);
  }
}
