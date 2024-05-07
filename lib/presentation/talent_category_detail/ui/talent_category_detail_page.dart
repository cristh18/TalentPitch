import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/talent_category_detail_repository.dart';
import '../../../di/service_locator.dart';
import '../cubit/talent_category_detail_cubit.dart';
import 'talent_category_detail_view.dart';

class TalentCategoryDetailPage extends StatelessWidget {
  const TalentCategoryDetailPage({Key? key, required this.talentCategoryUrl})
      : super(key: key);

  final String talentCategoryUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TalentCategoryDetailCubit>(
      create: (BuildContext context) => TalentCategoryDetailCubit(
          talentCategoryDetailRepository:
              locator<TalentCategoryDetailRepository>())
        ..getPitches(talentCategoryUrl),
      child: const TalentCategoryDetailView(),
    );
  }
}
