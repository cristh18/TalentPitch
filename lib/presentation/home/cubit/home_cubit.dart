import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import '../../../data/repositories/pitch_repository.dart';
import '../../../domain/models/pitch_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.pitchRepository}) : super(const HomeState());

  final PitchRepository pitchRepository;

  Future<void> getTalentPitches() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final List<PitchModel> pitches = await pitchRepository.getTalentPitches();
      final Logger logger = Logger();
      for (final PitchModel element in pitches) {
        logger.i(element.toString());
      }
      emit(state.copyWith(status: HomeStatus.success, pitches: pitches));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
