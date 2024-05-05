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
            final CategoryVideosCubit cubit =
                context.read<CategoryVideosCubit>();
            switch (state.status) {
              case CategoryVideosStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case CategoryVideosStatus.error:
                return const Center(
                  child: Text('Error'),
                );
              case CategoryVideosStatus.success:
                return ListView.builder(
                  itemCount: state.videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final VideoDataResponseDto categoryVideo =
                        state.videos[index];
                    return InkWell(
                        child: CategoryVideoItem(
                      categoryVideo: categoryVideo,
                      onVideoSelected: (VideoDataResponseDto video) {
                        Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) =>
                                    MoviePlayer(video: video)));
                      },
                    ));
                  },
                );
            }
          },
        ));
  }
}
