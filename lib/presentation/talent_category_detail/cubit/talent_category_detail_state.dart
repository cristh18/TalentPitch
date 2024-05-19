part of 'talent_category_detail_cubit.dart';

enum TalentCategoryDetailStatus {
  loading,
  success,
  error,
}

class TalentCategoryDetailState extends Equatable {
  const TalentCategoryDetailState({
    this.status = TalentCategoryDetailStatus.loading,
    this.pitches = const <PitchModel>[],
    this.errorDescrition = '',
  });

  final TalentCategoryDetailStatus status;
  final List<PitchModel> pitches;
  final String errorDescrition;

  TalentCategoryDetailState copyWith({
    TalentCategoryDetailStatus? status,
    List<PitchModel>? pitches,
    String? errorDescrition,
  }) {
    return TalentCategoryDetailState(
      status: status ?? this.status,
      pitches: pitches ?? this.pitches,
      errorDescrition: errorDescrition ?? this.errorDescrition,
    );
  }

  @override
  List<Object?> get props => <Object?>[status, pitches, errorDescrition];
}
