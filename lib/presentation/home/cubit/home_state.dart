part of 'home_cubit.dart';

enum HomeStatus {
  loading,
  success,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.loading,
    this.talentCategories = const <TalentCategoriesModel>[],
  });

  final HomeStatus status;
  final List<TalentCategoriesModel> talentCategories;

  HomeState copyWith({
    HomeStatus? status,
    List<TalentCategoriesModel>? talentCategories,
  }) {
    return HomeState(
      status: status ?? this.status,
      talentCategories: talentCategories ?? this.talentCategories,
    );
  }

  @override
  List<Object?> get props => <Object?>[status, talentCategories];
}
