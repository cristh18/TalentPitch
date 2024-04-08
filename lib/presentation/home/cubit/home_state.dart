part of 'home_cubit.dart';

enum HomeStatus {
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.pitches = const <PitchModel>[],
  });

  final HomeStatus status;
  final List<PitchModel> pitches;

  HomeState copyWith({
  HomeStatus? status,
    List<PitchModel>? pitches,
  }) {
    return HomeState(
      status: status ?? this.status,
      pitches: pitches ?? this.pitches,
    );
  }

  @override
  List<Object?> get props => <Object?>[status, pitches];
}
