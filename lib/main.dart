import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:status_saver/pre_layers/theme_manager.dart';
import 'package:status_saver/screens/download_folder.dart';
import 'package:status_saver/screens/settings.dart';
import 'package:status_saver/widgets/gridview.dart';
import 'package:status_saver/widgets/staggered_grid_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Status Saver',
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: const MyHomePage(title: 'Status Saver'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late bool permissionGranted = false;
  late TabController _tabController;

  // Future getStoragePermission() async {
  //   if (await Permission.storage.request().isGranted) {
  //     setState(() {
  //       permissionGranted = true;
  //     });
  //   } else if (await Permission.storage.request().isPermanentlyDenied) {
  //     await openAppSettings();
  //   } else if (await Permission.storage.request().isDenied) {
  //     setState(() {
  //       permissionGranted = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // getStoragePermission();
    _tabController = TabController(length: 2, vsync: this);
  }

  final Directory photoDir =
      Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FolderStaggeredGrid()));
                },
                icon: const Icon(Icons.folder_open_sharp)),
            IconButton(
                onPressed: () {
                  Share.share('Status Downloader');
                },
                icon: const Icon(Icons.share)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
                icon: const Icon(Icons.help_outline)),
          ],
        ),
        body: TabBarView(controller: _tabController, children: const [
          Center(
            child: StaggeredGrid(),
          ),
          Center(
            child: VideoGridview(),
          ),
        ]));
  }
}
