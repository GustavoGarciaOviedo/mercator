import 'package:flutter/material.dart';
import 'package:mercator/widgets/widgets.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('metodos de pago'),
      ),
      drawer: SideMenu(),
      body: Container(
        child: Center(
          child: Text('metodos de pago'),
        ),
      ),
    );
  }
}