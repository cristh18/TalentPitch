import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import '../../../data/datasources/remote/dtos/pitch_dto.dart';
import '../../../data/datasources/remote/dtos/talent_category_detail_dto.dart';
import '../../../data/repositories/talent_category_detail_repository.dart';

part 'talent_category_detail_state.dart';

class TalentCategoryDetailCubit extends Cubit<TalentCategoryDetailState> {
  TalentCategoryDetailCubit({
    required this.talentCategoryDetailRepository,
  }) : super(const TalentCategoryDetailState());

  final TalentCategoryDetailRepository talentCategoryDetailRepository;

  Future<void> getPitches(String url) async {
    emit(state.copyWith(status: TalentCategoryDetailStatus.loading));
    try {
      final TalentCategoryDetailDto talentCategoryDetailDto =
          await talentCategoryDetailRepository.getTalentCategoryDetail(url);
      final Logger logger = Logger();
      for (final PitchDto element
          in talentCategoryDetailDto.data) {
        logger.i(element.toString());
      }
      emit(state.copyWith(
          status: TalentCategoryDetailStatus.success,
          pitches: talentCategoryDetailDto.data));
    } catch (e) {
      emit(state.copyWith(status: TalentCategoryDetailStatus.error));
    }
  }
}
