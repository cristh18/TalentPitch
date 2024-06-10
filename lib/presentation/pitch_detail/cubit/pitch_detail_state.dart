part of 'pitch_detail_cubit.dart';

enum PitchDetailStatus {
  nothing,
  loading,
  success,
  error,
}

class PitchDetailState extends Equatable {
  const PitchDetailState({
    this.status = PitchDetailStatus.nothing,
  });

  final PitchDetailStatus status;

  PitchDetailState copyWith({
    PitchDetailStatus? status,
  }) {
    return PitchDetailState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => <Object?>[status];
}
