import '../../domain/models/pitch_model.dart';
import '../datasources/remote/apis/talent_category_detail_api.dart';
import '../datasources/remote/dtos/pitch_dto.dart';
import '../datasources/remote/dtos/talent_category_detail_dto.dart';
import '../datasources/remote/mappers/pitch_dto_mapper.dart';

class TalentCategoryDetailRepository {
  TalentCategoryDetailRepository({required this.talentCategoryDetailApi});

  final TalentCategoryDetailApi talentCategoryDetailApi;

  Future<List<PitchModel>> getPitches(String url) {
    final String newUrl = url.replaceAll('https://data2.talentpitch.co', '/');

    return talentCategoryDetailApi
        .getTalentCategoryDetail(newUrl)
        .then((TalentCategoryDetailDto talentCategoryDetailDto) {
      final List<PitchModel> pitches = talentCategoryDetailDto.data
          .map((PitchDto pitchDto) => pitchDto.toDomain())
          .toList();
      return pitches;
    });
  }
}
