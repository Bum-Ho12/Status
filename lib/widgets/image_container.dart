import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_menu/pie_menu.dart';

class PicContainer extends StatefulWidget {
  final String image;
  final double maxHeight;
  final bool mainScreen;

  const PicContainer(
      {super.key,
      required this.image,
      required this.maxHeight,
      required this.mainScreen});

  @override
  State<PicContainer> createState() => _PicContainerState();
}

class _PicContainerState extends State<PicContainer> {
  @override
  Widget build(BuildContext context) {
    if (widget.image.isNotEmpty) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).hoverColor),
        constraints: const BoxConstraints(maxHeight: 250, maxWidth: 200),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(alignment: Alignment.center, children: [
            widget.mainScreen
                ? InkWell(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ImageLarge(image: widget.image))));
                    }),
                    child: Image.asset(widget.image,
                        filterQuality: FilterQuality.high, fit: BoxFit.fill),
                  )
                : PieMenu(
                    actions: [
                      PieAction(
                          tooltip: 'share',
                          onSelect: () {},
                          child: const FaIcon(Icons.share)),
                      PieAction(
                          tooltip: 'Delete',
                          onSelect: () {},
                          child: const FaIcon(Icons.delete)),
                    ],
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  ImageLarge(image: widget.image))));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(widget.image,
                          filterQuality: FilterQuality.high, fit: BoxFit.fill),
                    ),
                  ),
            widget.mainScreen
                ? Positioned(
                    bottom: 10,
                    right: 10,
                    child: InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xfF128C7E),
                            child: Icon(Icons.arrow_downward_rounded))),
                  )
                : const SizedBox(),
          ]),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).hoverColor),
        height: 250,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
              bottom: 20,
              right: 10,
              child: InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xfF128C7E),
                      child: Icon(Icons.arrow_downward_rounded))),
            ),
          ]),
        ),
      );
    }
  }
}

class ImageLarge extends StatefulWidget {
  final String image;
  const ImageLarge({super.key, required this.image});

  @override
  State<ImageLarge> createState() => _ImageLargeState();
}

class _ImageLargeState extends State<ImageLarge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: Center(
        child: Image.asset(widget.image),
      ),
    );
  }
}
