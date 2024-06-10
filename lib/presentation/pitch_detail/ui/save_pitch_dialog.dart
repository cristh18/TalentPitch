import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/favorite_talents_repository.dart';
import '../../../di/service_locator.dart';
import '../../../domain/models/pitch_model.dart';
import '../../home/ui/home_page.dart';
import '../cubit/pitch_detail_cubit.dart';

class SavePitchDialog extends StatelessWidget {
  const SavePitchDialog({
    Key? key,
    required this.pitchData,
  }) : super(key: key);

  final Map<String, dynamic> pitchData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PitchDetailCubit>(
      create: (BuildContext context) => PitchDetailCubit(
          favoriteTalentsRepository: locator<FavoriteTalentsRepository>()),
      child: Builder(
        builder: (BuildContext context) {
          final PitchDetailCubit cubit = context.read<PitchDetailCubit>();
          final PitchModel pitchModel = PitchModel.fromMap(pitchData);
          return BlocListener<PitchDetailCubit, PitchDetailState>(
            listener: (BuildContext context, PitchDetailState state) {
              if (state.status == PitchDetailStatus.success) {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => const HomePage(),
                  ),
                );
              }
            },
            child: AlertDialog(
              title: const Text('Add video to playlist'),
              content: const Text(
                'Do you want to add this video to your playlist?',
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Yes'),
                  onPressed: () {
                    cubit.saveVideo(pitchModel);
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @pragma('vm:entry-point')
  static Route<Object?> dialogBuilder(BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return SavePitchDialog(pitchData: arguments! as Map<String, dynamic>);
      },
    );
  }
}
