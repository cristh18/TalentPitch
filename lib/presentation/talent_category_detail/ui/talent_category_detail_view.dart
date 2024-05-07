import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/pitch_model.dart';
import '../../video_player/ui/media_player.dart';
import '../cubit/talent_category_detail_cubit.dart';
import 'items/pitch_item.dart';

class TalentCategoryDetailView extends StatelessWidget {
  const TalentCategoryDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Videos View'),
      ),
      body: BlocBuilder<TalentCategoryDetailCubit, TalentCategoryDetailState>(
        builder: (BuildContext context, TalentCategoryDetailState state) {
          switch (state.status) {
            case TalentCategoryDetailStatus.loading:
              return _showLoaderWidget();
            case TalentCategoryDetailStatus.error:
              return _showErrorWidget();
            case TalentCategoryDetailStatus.success:
              return _showCategoryPitchesWidget(state);
          }
        },
      ),
    );
  }

  ListView _showCategoryPitchesWidget(TalentCategoryDetailState state) {
    return ListView.builder(
      itemCount: state.pitches.length,
      itemBuilder: (BuildContext context, int index) {
        return PicthItem(
          pitch: state.pitches[index],
          onPitchSelected: (PitchModel pitch) {
            _navigateToMoviePlayer(context, pitch);
          },
        );
      },
    );
  }

  Center _showErrorWidget() {
    return const Center(
      child: Text('Error'),
    );
  }

  Center _showLoaderWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void _navigateToMoviePlayer(BuildContext context, PitchModel pitch) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => MoviePlayer(pitch: pitch),
      ),
    );
  }
}
