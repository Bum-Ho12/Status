import 'package:flutter/material.dart';

class VideoContainer extends StatefulWidget {
  const VideoContainer({super.key});

  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).hoverColor),
      constraints: const BoxConstraints(
          maxHeight: 250, minHeight: 200, maxWidth: 200, minWidth: 170),
      child: Image.asset('name',
          filterQuality: FilterQuality.high, fit: BoxFit.fill),
    );
  }
}
