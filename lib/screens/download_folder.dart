import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:status_saver/widgets/image_container.dart';

import '../widgets/gridview.dart';

class FolderStaggeredGrid extends StatefulWidget {
  const FolderStaggeredGrid({super.key});

  @override
  State<FolderStaggeredGrid> createState() => _FolderStaggeredGridState();
}

class _FolderStaggeredGridState extends State<FolderStaggeredGrid>
    with TickerProviderStateMixin {
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

  late TabController _tabController;
  late bool mainScreen = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        bottom: TabBar(
            controller: _tabController,
            labelColor: const Color(0xfF128C7E),
            tabs: const [
              Tab(
                text: 'Pictures',
              ),
              Tab(
                text: 'Videos',
              )
            ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PieCanvas(
              theme: const PieTheme(
                  overlayColor: Colors.white10,
                  buttonThemeHovered: PieButtonTheme(
                      backgroundColor: Color(0xfF128C7E),
                      iconColor: Colors.white),
                  buttonTheme: PieButtonTheme(
                      backgroundColor: Color(0xfF25D366),
                      iconColor: Colors.white),
                  tooltipStyle:
                      TextStyle(color: Color(0xfF25D366), fontSize: 30)),
              child: ListView(children: [
                MasonryGridView.count(
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
                  },
                ),
              ]),
            ),
          ),
        ),
        const Center(
          child: VideoGridview(),
        ),
      ]),
    );
  }
}
