import '../../domain/models/talent_categories_model.dart';
import '../datasources/remote/apis/talents_api.dart';
import '../datasources/remote/dtos/talent_categories_dto.dart';
import '../datasources/remote/dtos/talents_dto.dart';
import '../datasources/remote/mappers/talent_categories_dto_mapper.dart';

class TalentsRepository {
  TalentsRepository({required this.talentPitchApi});

  final TalentsApi talentPitchApi;

  Future<List<TalentCategoriesModel>> getTalentCategories() {
    return talentPitchApi.getTalents().then((TalentsDto talentsDto) {
      final List<TalentCategoriesModel> talentCategories = talentsDto.data
          .map((TalentCategoriesDto talentCategoriesDto) =>
              talentCategoriesDto.toDomain())
          .toList();
      return talentCategories;
    });
  }
}
