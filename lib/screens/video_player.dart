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
  late ChewieController _chewieController;

  Future<void> createPlayer() async {
    try {
      VideoPlayerController videoplayer =
          VideoPlayerController.asset(widget.videoPlayerController);
      _chewieController = ChewieController(
        videoPlayerController: videoplayer,
        aspectRatio: 5 / 8,
        autoPlay: true,
        autoInitialize: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          );
        },
      );
    } catch (e) {
      SnackBar snack = SnackBar(
        content: Text('$e'),
        padding: const EdgeInsets.all(8.0),
        dismissDirection: DismissDirection.horizontal,
        action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              Navigator.pop(context);
            }),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }
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
      ),
      body: FutureBuilder(
          future: createPlayer(),
          builder: (context, snapshot) {
            return Center(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: 250,
                    maxWidth: MediaQuery.of(context).size.width),
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }
}
