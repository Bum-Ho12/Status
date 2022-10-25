import 'package:flutter/material.dart';
import 'package:status_saver/pre_layers/theme_manager.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(widget.title),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: const Center(
        child: StaggeredGrid(),
      ),
    );
  }
}
