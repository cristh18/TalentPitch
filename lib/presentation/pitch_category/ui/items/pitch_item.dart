import 'package:flutter/material.dart';
import '../../../../data/datasources/remote/dtos/video_data_response_dto.dart';

class PicthItem extends StatelessWidget {
  const PicthItem({
    Key? key,
    required this.categoryVideo,
    required this.onVideoSelected,
  }) : super(key: key);

  final VideoDataResponseDto categoryVideo;
  final Function(VideoDataResponseDto) onVideoSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onVideoSelected(categoryVideo),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                categoryVideo.avatar,
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
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  categoryVideo.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  categoryVideo.desiredRole,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
