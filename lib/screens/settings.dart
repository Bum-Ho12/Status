import 'package:flutter/material.dart';
import 'package:status_saver/screens/about.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // bool darkMode = false;
  // ThemeClass theme = ThemeClass.lightTheme as ThemeClass;

  // Future getTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(children: [
          // SwitchListTile(
          //   value: darkMode,
          //   onChanged: (value) {
          //     setState(() {
          //       darkMode = value;
          //     });
          //   },
          //   title: const Text('Dark Theme'),
          // ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()));
            },
            title: const Text('About'),
          ),
          ListTile(
            onTap: () {},
            title: const Text('Version'),
            subtitle: const Text('v 0.0.1'),
          ),
        ]),
      ),
    );
  }
}
