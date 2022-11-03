// ignore_for_file: avoid_print

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoShowPlayer extends StatefulWidget {
  final String videoPlayerController;
  final bool mainscreen;
  const VideoShowPlayer({
    super.key,
    required this.videoPlayerController,
    required this.mainscreen,
  });

  @override
  State<VideoShowPlayer> createState() => _VideoShowPlayerState();
}

class _VideoShowPlayerState extends State<VideoShowPlayer> {
  late ChewieController _chewieController;
  late bool autoplay = false;

  @override
  void initState() {
    super.initState();
    try {
      VideoPlayerController videoplayer =
          VideoPlayerController.asset(widget.videoPlayerController);
      _chewieController = ChewieController(
        videoPlayerController: videoplayer,
        aspectRatio: videoplayer.value.aspectRatio * 0.9,
        autoInitialize: true,
        showControls: false,
        autoPlay: autoplay,
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
        title: const Text('Downloads'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).hoverColor),
            constraints: const BoxConstraints(maxHeight: 250),
            child: Stack(alignment: Alignment.center, children: [
              VisibilityDetector(
                key: const Key('1'),
                onVisibilityChanged: (info) {},
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      autoplay = true;
                    });
                  },
                  child: const CircleAvatar(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xfF128C7E),
                      child: Icon(Icons.play_arrow))),
              widget.mainscreen
                  ? Positioned(
                      bottom: 20,
                      right: 10,
                      child: InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xfF128C7E),
                              child: Icon(Icons.arrow_downward_rounded))),
                    )
                  : const SizedBox(),
            ])),
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }
}
