import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import '../../../data/repositories/talent_category_detail_repository.dart';
import '../../../domain/models/pitch_model.dart';

part 'talent_category_detail_state.dart';

class TalentCategoryDetailCubit extends Cubit<TalentCategoryDetailState> {
  TalentCategoryDetailCubit({
    required this.talentCategoryDetailRepository,
  }) : super(const TalentCategoryDetailState());

  final TalentCategoryDetailRepository talentCategoryDetailRepository;

  Future<void> getPitches(String url) async {
    emit(state.copyWith(status: TalentCategoryDetailStatus.loading));
    try {
      final List<PitchModel> pitches =
          await talentCategoryDetailRepository.getPitches(url);
      final Logger logger = Logger();
      for (final PitchModel element in pitches) {
        logger.i(element.toString());
      }
      emit(state.copyWith(
          status: TalentCategoryDetailStatus.success, pitches: pitches));
    } catch (e) {
      emit(state.copyWith(
          status: TalentCategoryDetailStatus.error,
          errorDescrition: e.toString()));
    }
  }
}
