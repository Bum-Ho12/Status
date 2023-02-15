import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:status_saver/widgets/image_container.dart';

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
        theme: const PieTheme(
            overlayColor: Colors.white10,
            buttonThemeHovered: PieButtonTheme(
                backgroundColor: Color(0xfF128C7E), iconColor: Colors.white),
            buttonTheme: PieButtonTheme(
                backgroundColor: Color(0xfF25D366), iconColor: Colors.white),
            tooltipStyle: TextStyle(color: Color(0xfF25D366), fontSize: 30)),
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
                return PicContainer(
                  image: imageList[index],
                  maxHeight: 250,
                  mainScreen: mainScreen,
                );
              }),
        ]),
      ),
    );
  }
}
