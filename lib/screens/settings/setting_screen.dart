import 'package:flutter/material.dart';
import 'package:mercator/widgets/side_menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static String routeName = 'SettingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      drawer: SideMenu(),
      body: Center(
        child: Text('settings'),
      ),
    );
  }
}