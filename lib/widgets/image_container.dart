import 'package:flutter/material.dart';

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
            Image.asset(widget.image,
                filterQuality: FilterQuality.high, fit: BoxFit.fill),
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
        constraints: const BoxConstraints(maxHeight: 250, maxWidth: 200),
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
  const ImageLarge({super.key});

  @override
  State<ImageLarge> createState() => _ImageLargeState();
}

class _ImageLargeState extends State<ImageLarge> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
