import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/category_videos_cubit.dart';
import 'category_videos_view.dart';

class CategoryVideosPage extends StatelessWidget {

  const CategoryVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryVideosCubit>(
      create: (BuildContext context) => CategoryVideosCubit(
          ),
      child: const CategoryVideosView(),
    );
  }
}