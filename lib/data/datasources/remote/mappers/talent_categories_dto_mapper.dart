import '../../../../domain/models/talent_categories_model.dart';
import '../dtos/talent_categories_dto.dart';

extension TalentCategoriesDtoMapper on TalentCategoriesDto {
  TalentCategoriesModel toDomain() {
    return TalentCategoriesModel(
        title: title, 
        key: key, 
        url: url, 
        type: type, 
        image: image);
  }
}
