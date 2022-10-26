import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoShowPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;
  const VideoShowPlayer({
    super.key,
    required this.videoPlayerController,
    required this.looping,
    required this.autoplay,
  });

  @override
  State<VideoShowPlayer> createState() => _VideoShowPlayerState();
}

class _VideoShowPlayerState extends State<VideoShowPlayer> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 4 / 8,
      autoInitialize: true,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).hoverColor),
        constraints: const BoxConstraints(maxHeight: 250, maxWidth: 200),
        child: ClipRRect(
          child: Chewie(
            controller: _chewieController,
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }
}
