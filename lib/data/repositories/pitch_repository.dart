import '../../domain/models/pitch_model.dart';
import '../datasources/remote/apis/talent_pitch_api.dart';
import '../datasources/remote/dtos/pitch_response_dto.dart';
import '../datasources/remote/mappers/pitch_response_dto_mapper.dart';

class PitchRepository {
  PitchRepository({required this.talentPitchApi});

  final TalentPitchApi talentPitchApi;

  Future<List<PitchModel>> getTalentPitches() {
    return talentPitchApi
        .getTalentPitches()
        .then((List<PitchResponseDto> pitches) {
      return pitches
          .map((PitchResponseDto pitchResponseDto) =>
              pitchResponseDto.toDomain())
          .toList();
    });
  }
}
