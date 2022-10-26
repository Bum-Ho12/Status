import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:status_saver/widgets/image_container.dart';
import 'package:mime/mime.dart';
import 'package:status_saver/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

class StaggeredGrid extends StatefulWidget {
  const StaggeredGrid({super.key});

  @override
  State<StaggeredGrid> createState() => _StaggeredGridState();
}

class _StaggeredGridState extends State<StaggeredGrid> {
  List imageList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/mov_3.mp4',
    'assets/3.jpg',
    'assets/mov_2.mp4',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/mov_1.mp4',
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
    'assets/10.jpg',
    'assets/11.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      itemCount: imageList.length,
      itemBuilder: (BuildContext context, int index) {
        String? mimeStr = lookupMimeType(imageList[index]);
        var fileType = mimeStr?.split('/');
        if (fileType![0] == 'image') {
          return PicContainer(
            image: imageList[index],
            maxHeight: (index % 5 + 1) * 100,
          );
        } else {
          return VideoShowPlayer(
              videoPlayerController: VideoPlayerController.asset(
                imageList[index],
              ),
              looping: false,
              autoplay: true);
        }
      },
    );
  }
}
