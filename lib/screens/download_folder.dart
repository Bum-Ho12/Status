import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:status_saver/widgets/image_container.dart';
import 'package:mime/mime.dart';
import '../widgets/video_container.dart';

class FolderStaggeredGrid extends StatefulWidget {
  const FolderStaggeredGrid({super.key});

  @override
  State<FolderStaggeredGrid> createState() => _FolderStaggeredGridState();
}

class _FolderStaggeredGridState extends State<FolderStaggeredGrid> {
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
  late bool mainScreen = false;

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: PieCanvas(
          theme: const PieTheme(
              overlayColor: Colors.white10,
              buttonThemeHovered: PieButtonTheme(
                  backgroundColor: Color(0xfF128C7E), iconColor: Colors.white),
              buttonTheme: PieButtonTheme(
                  backgroundColor: Color(0xfF25D366), iconColor: Colors.white),
              tooltipStyle: TextStyle(color: Color(0xfF25D366), fontSize: 30)),
          child: ListView(children: [
            MasonryGridView.count(
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
      ),
    );
  }
}
