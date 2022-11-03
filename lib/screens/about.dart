import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('About Status Saver'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RichText(
            text: const TextSpan(
          text: 'Status saver is an application that is '
              'used to save into the gallery photos and videos from WhatsApp. '
              'It was developed in November, 2022 by Bum-Ho Nisubire and currently deployed '
              'as a prototype for users to get a feel of it and decide if it is best for them.',
        )),
      ),
    );
  }
}
