import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/remote/dtos/video_data_response_dto.dart';
import '../../video_player/ui/media_player.dart';
import '../cubit/category_videos_cubit.dart';
import 'items/category_video_item.dart';

class CategoryVideosView extends StatelessWidget {
  const CategoryVideosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Videos View'),
      ),
      body: BlocBuilder<CategoryVideosCubit, CategoryVideosState>(
        builder: (BuildContext context, CategoryVideosState state) {
          switch (state.status) {
            case CategoryVideosStatus.loading:
              return _showLoaderWidget();
            case CategoryVideosStatus.error:
              return _showErrorWidget();
            case CategoryVideosStatus.success:
              return _showCategoryVideoListWidget(state);
          }
        },
      ),
    );
  }

  ListView _showCategoryVideoListWidget(CategoryVideosState state) {
    return ListView.builder(
      itemCount: state.videos.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryVideoItem(
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
