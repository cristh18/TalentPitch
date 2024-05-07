import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/category_videos_repository.dart';
import '../../../di/service_locator.dart';
import '../cubit/pitch_category_cubit.dart';
import 'pitch_category_view.dart';

class PitchCategoryPage extends StatelessWidget {
  const PitchCategoryPage({Key? key, required this.categoryVideosUrl})
      : super(key: key);

  final String categoryVideosUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PitchCategoryCubit>(
      create: (BuildContext context) => PitchCategoryCubit(
          categoryVideosRepository: locator<CategoryVideosRepository>())
        ..getCategoryVideos(categoryVideosUrl),
      child: const PitchCategoryView(),
    );
  }
}
