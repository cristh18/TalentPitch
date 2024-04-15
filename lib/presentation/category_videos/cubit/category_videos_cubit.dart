import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_videos_state.dart';

class CategoryVideosCubit extends Cubit<CategoryVideosState> {
  CategoryVideosCubit() : super(CategoryVideosInitial());
}
