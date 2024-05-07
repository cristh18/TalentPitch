import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/talents_repository.dart';
import '../../../di/service_locator.dart';
import '../cubit/home_cubit.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(
          talentsRepository: locator<TalentsRepository>())
        ..getTalentCategories(),
      child: const HomeView(),
    );
  }
}
