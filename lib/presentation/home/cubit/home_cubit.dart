import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import '../../../data/repositories/talents_repository.dart';
import '../../../domain/models/talent_categories_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.talentsRepository}) : super(const HomeState());

  final TalentsRepository talentsRepository;

  Future<void> getTalentCategories() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final List<TalentCategoriesModel> talentCategories =
          await talentsRepository.getTalentCategories();
      final Logger logger = Logger();
      for (final TalentCategoriesModel element in talentCategories) {
        logger.i(element.toString());
      }
      emit(state.copyWith(
          status: HomeStatus.success, talentCategories: talentCategories));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
