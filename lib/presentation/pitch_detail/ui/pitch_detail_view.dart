import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/pitch_model.dart';
import '../../home/ui/home_page.dart';
import '../cubit/pitch_detail_cubit.dart';
import 'media_player.dart';

class PitchDetailView extends StatelessWidget {
  const PitchDetailView({
    Key? key,
    required this.pitchModel,
  }) : super(key: key);

  final PitchModel pitchModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ..._buildBackground(context),
          _buildPitchInformation(context),
          _buildActions(context),
          _showSavingVideoResult(context)
        ],
      ),
    );
  }

  List<Widget> _buildBackground(BuildContext context) {
    return <Widget>[
      Container(
        height: double.infinity,
        color: const Color(0xFF000B49),
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.transparent,
                Color.fromARGB(255, 67, 76, 127),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: <double>[0.3, 0.5],
            ),
          ),
        ),
      ),
    ];
  }

  Positioned _buildPitchInformation(BuildContext context) {
    String pitchInformationText = pitchModel.desiredRole;

    if (pitchModel.resumeDescription != null &&
        pitchModel.resumeDescription.isNotEmpty) {
      pitchInformationText = pitchModel.resumeDescription;
    } else if (pitchModel.skills != null && pitchModel.skills.isNotEmpty) {
      pitchInformationText = pitchModel.skills;
    }

    return Positioned(
      top: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                pitchModel.avatar,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Text(
              pitchModel.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${pitchModel.country} | ${pitchModel.city} | ${pitchModel.knowledges}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            Text(
              pitchInformationText,
              maxLines: 8,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(height: 1.75, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildActions(BuildContext context) {
    final PitchDetailCubit cubit = context.read<PitchDetailCubit>();
    return Positioned(
      bottom: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                backgroundColor: const Color(0xFFFF7272),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.425, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                cubit.saveVideo(pitchModel);
              },
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Add to ',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const TextSpan(
                      text: 'Watchlist',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                backgroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.425, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                if (Uri.parse(pitchModel.videoUrl).isAbsolute) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          MoviePlayer(pitchVideoUrl: pitchModel.videoUrl),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid video URL'),
                    ),
                  );
                }
              },
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Start ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: 'Watching',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showSavingVideoResult(BuildContext context) {
    return BlocBuilder<PitchDetailCubit, PitchDetailState>(
      builder: (BuildContext context, PitchDetailState state) {
    
        switch (state.status) {
          case PitchDetailStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PitchDetailStatus.error:
            return const Center(
              child: Text(
                  'Failed to save video to your watchlist. Please try again.'),
            );
          case PitchDetailStatus.success:
            return Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'Video saved to your watchlist successfully.',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text('Close'),
                ),
              ],
            );
        }
      },
    );
  }
}
