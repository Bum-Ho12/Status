import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class VideoContainer extends StatefulWidget {
  final String videoPlayed;
  final bool mainScreen;
  const VideoContainer(
      {super.key, required this.videoPlayed, required this.mainScreen});

  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  // @override
  // void initState() {
  //   super.initState();
  //   generateThumbnail();
  // }

  Uint8List? _thumbnailData;

  Future<File> copyAssetFile(String assetFileName) async {
    Directory tempDir = await getTemporaryDirectory();
    final byteData = await rootBundle.load(assetFileName);

    File videoThumbnailFile = File("${tempDir.path}/$assetFileName")
      ..createSync(recursive: true)
      ..writeAsBytesSync(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return videoThumbnailFile;
  }

  Future<void> generateThumbnail() async {
    File videoTempFile2 = await copyAssetFile(widget.videoPlayed);
    try {
      _thumbnailData = await VideoThumbnail.thumbnailData(
        video: videoTempFile2.path,
        imageFormat: ImageFormat.PNG,
        maxWidth: 250,
        maxHeight: 300,
        quality: 25,
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: generateThumbnail(),
        builder: (context, snapshot) {
          return _thumbnailData != null
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).hoverColor),
                  constraints: const BoxConstraints(
                      maxHeight: 300,
                      minHeight: 200,
                      maxWidth: 200,
                      minWidth: 170),
                  child: Stack(alignment: Alignment.center, children: [
                    Image.memory(
                      _thumbnailData!,
                      fit: BoxFit.cover,
                    ),
                    InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xfF128C7E),
                            child: Icon(Icons.play_arrow))),
                    widget.mainScreen
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
                  ]))
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).hoverColor),
                  constraints: const BoxConstraints(
                      maxHeight: 250,
                      minHeight: 200,
                      maxWidth: 200,
                      minWidth: 170),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        });
  }
}
