import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/category_videos_repository.dart';
import '../../../di/service_locator.dart';
import '../cubit/category_videos_cubit.dart';
import 'category_videos_view.dart';

class CategoryVideosPage extends StatelessWidget {
  const CategoryVideosPage({Key? key, required this.categoryVideosUrl})
      : super(key: key);

  final String categoryVideosUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryVideosCubit>(
      create: (BuildContext context) => CategoryVideosCubit(
          categoryVideosRepository: locator<CategoryVideosRepository>())
        ..getCategoryVideos(categoryVideosUrl),
      child: const CategoryVideosView(),
    );
  }
}
