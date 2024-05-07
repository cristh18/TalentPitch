import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/remote/dtos/video_data_response_dto.dart';
import '../../video_player/ui/media_player.dart';
import '../cubit/pitch_category_cubit.dart';
import 'items/pitch_item.dart';

class PitchCategoryView extends StatelessWidget {
  const PitchCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Videos View'),
      ),
      body: BlocBuilder<PitchCategoryCubit, PitchCategoryState>(
        builder: (BuildContext context, PitchCategoryState state) {
          switch (state.status) {
            case PictCategoryStatus.loading:
              return _showLoaderWidget();
            case PictCategoryStatus.error:
              return _showErrorWidget();
            case PictCategoryStatus.success:
              return _showCategoryVideoListWidget(state);
          }
        },
      ),
    );
  }

  ListView _showCategoryVideoListWidget(PitchCategoryState state) {
    return ListView.builder(
      itemCount: state.videos.length,
      itemBuilder: (BuildContext context, int index) {
        return PicthItem(
          categoryVideo: state.videos[index],
          onVideoSelected: (VideoDataResponseDto video) {
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

  void _navigateToMoviePlayer(
      BuildContext context, VideoDataResponseDto video) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => MoviePlayer(video: video),
      ),
    );
  }
}
