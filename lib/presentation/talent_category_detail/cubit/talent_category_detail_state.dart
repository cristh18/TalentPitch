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
  });

  final TalentCategoryDetailStatus status;
  final List<PitchModel> pitches;

  TalentCategoryDetailState copyWith({
    TalentCategoryDetailStatus? status,
    List<PitchModel>? pitches,
  }) {
    return TalentCategoryDetailState(
      status: status ?? this.status,
      pitches: pitches ?? this.pitches,
    );
  }

  @override
  List<Object?> get props => <Object?>[status, pitches];
}
