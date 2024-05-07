import '../datasources/remote/apis/talent_category_detail_api.dart';
import '../datasources/remote/dtos/talent_category_detail_dto.dart';

class TalentCategoryDetailRepository {
  TalentCategoryDetailRepository({required this.talentCategoryDetailApi});

  final TalentCategoryDetailApi talentCategoryDetailApi;

  Future<TalentCategoryDetailDto> getTalentCategoryDetail(String url) {
    final String newUrl = url.replaceAll('https://data2.talentpitch.co', '/');
    return talentCategoryDetailApi.getTalentCategoryDetail(newUrl);
  }
}
