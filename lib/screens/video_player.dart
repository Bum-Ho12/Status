import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoShowPlayer extends StatefulWidget {
  final String videoPlayerController;

  const VideoShowPlayer({
    super.key,
    required this.videoPlayerController,
  });

  @override
  State<VideoShowPlayer> createState() => _VideoShowPlayerState();
}

class _VideoShowPlayerState extends State<VideoShowPlayer> {
  late ChewieController chewieVideo;

  Future<void> initializeFlicker() async {
    chewieVideo = ChewieController(
        videoPlayerController:
            VideoPlayerController.asset(widget.videoPlayerController),
        autoInitialize: true,
        aspectRatio: 5 / 6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: FutureBuilder(
          future: initializeFlicker(),
          builder: (context, snapshot) {
            return Center(
              child: Chewie(controller: chewieVideo),
            );
          }),
    );
  }

  @override
  void dispose() {
    chewieVideo.dispose();
    super.dispose();
  }
}
