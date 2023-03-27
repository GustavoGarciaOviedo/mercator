import 'package:flutter/material.dart';
import 'package:mercator/widgets/widgets.dart';

class UserAddress extends StatelessWidget {
  const UserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('direccion de usuario'),
      ),
      drawer: SideMenu(),
      body: Container(
        child: Center(
          child: Text('direccion de usuario'),
        ),
      ),
    );
  }
}