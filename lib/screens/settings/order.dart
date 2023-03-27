import 'package:flutter/material.dart';
import 'package:mercator/widgets/widgets.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pedidos'),
      ),
      drawer: SideMenu(),
      body:  Container(
        child: Center(
          child: Text('pedidos'),
        ),
      ),
    );
  }
}