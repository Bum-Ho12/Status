import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:status_saver/widgets/image_container.dart';
import 'package:mime/mime.dart';
import 'package:status_saver/widgets/video_container.dart';

class StaggeredGrid extends StatefulWidget {
  const StaggeredGrid({super.key});

  @override
  State<StaggeredGrid> createState() => _StaggeredGridState();
}

class _StaggeredGridState extends State<StaggeredGrid> {
  List imageList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
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

  late bool mainScreen = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: PieCanvas(
        child: ListView(children: [
          MasonryGridView.count(
            addAutomaticKeepAlives: true,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                  maxHeight: 250,
                  mainScreen: mainScreen,
                );
              } else {
                return VideoContainer(
                    videoPlayed: imageList[index], mainScreen: mainScreen);
              }
            },
          ),
        ]),
      ),
    );
  }
}
