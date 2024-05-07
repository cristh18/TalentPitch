import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/remote/dtos/pitch_dto.dart';
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
          categoryVideo: state.pitches[index],
          onVideoSelected: (PitchDto video) {
            _navigateToMoviePlayer(context, video);
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

  void _navigateToMoviePlayer(BuildContext context, PitchDto video) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => MoviePlayer(video: video),
      ),
    );
  }
}
