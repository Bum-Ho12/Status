import 'package:flutter/material.dart';

class PicContainer extends StatefulWidget {
  final String image;
  final double maxHeight;
  const PicContainer({super.key, required this.image, required this.maxHeight});

  @override
  State<PicContainer> createState() => _PicContainerState();
}

class _PicContainerState extends State<PicContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).hoverColor),
      constraints: const BoxConstraints(maxHeight: 250, maxWidth: 200),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(widget.image,
            filterQuality: FilterQuality.high, fit: BoxFit.fill),
      ),
    );
  }
}

class BorderRadious {}
