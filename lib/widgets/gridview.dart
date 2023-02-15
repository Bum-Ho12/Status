import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:status_saver/widgets/video_container.dart';

class VideoGridview extends StatefulWidget {
  const VideoGridview({super.key});

  @override
  State<VideoGridview> createState() => _VideoGridviewState();
}

class _VideoGridviewState extends State<VideoGridview> {
  List videoList = [
    'assets/mov_1.mp4',
    'assets/mov_2.mp4',
  ];

  late bool mainScreen = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          GridView.builder(
            itemCount: videoList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10, crossAxisCount: 2, crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return VideoContainer(
                  videoPlayed: videoList[index], mainScreen: mainScreen);
            },
          ),
        ]),
      ),
    );
  }
}
