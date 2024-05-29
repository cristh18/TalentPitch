import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasources/local/entities/playlist_entity.dart';
import '../../../data/datasources/local/entities/video_entity.dart';
import '../../../data/repositories/favorite_talents_repository.dart';
import '../../../di/service_locator.dart';
import '../../../domain/models/pitch_model.dart';
import '../cubit/pitch_detail_cubit.dart';
import 'pitch_detail_view.dart';

class PitchDetailPage extends StatelessWidget {
  const PitchDetailPage({super.key, required this.pitchModel});

  final PitchModel pitchModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PitchDetailCubit>(
        create: (BuildContext context) => PitchDetailCubit(
            favoriteTalentsRepository: locator<FavoriteTalentsRepository>()),
        child: PitchDetailView(pitchModel: pitchModel));
  }
}
