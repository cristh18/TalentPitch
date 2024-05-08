import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatefulWidget {
  const MoviePlayer({
    Key? key,
    required this.pitchVideoUrl,
  }) : super(key: key);

  final String pitchVideoUrl;

  @override
  State<MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    try {
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.pitchVideoUrl))
            ..initialize().then((_) {
              // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
              setState(() {});
            });

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 16 / 9,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load video'),
        ),
      );
    }
  }

  @override
  void dispose() {
    if (videoPlayerController != null) {
      videoPlayerController.dispose();
    }

    if (chewieController != null) {
      chewieController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Chewie(controller: chewieController),
      ),
    );
  }
}
