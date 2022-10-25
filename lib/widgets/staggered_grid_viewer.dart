import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      itemCount: imageList.length,
      itemBuilder: (BuildContext context, int index) {
        return PicContainer(
          image: imageList[index],
          maxHeight: (index % 5 + 1) * 100,
        );
      },
    );
  }
}
