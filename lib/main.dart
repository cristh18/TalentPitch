import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'data/datasources/remote/apis/talent_pitch_api.dart';
import 'data/repositories/pitch_repository.dart';
import 'network/http_dio_manager.dart';
import 'presentation/home/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpDioManager httpDioManager =
        HttpDioManager(interceptors: <InterceptorsWrapper>[]);
    // final Dio dio = Dio();
    return RepositoryProvider<PitchRepository>(
      create: (BuildContext context) =>
          PitchRepository(talentPitchApi: TalentPitchApi(httpDioManager.dio)),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomePage(),
      ),
    );
  }
}
