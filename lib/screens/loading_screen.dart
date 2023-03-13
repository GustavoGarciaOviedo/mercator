import 'package:flutter/material.dart';


class LoadingScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('productos'),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.pink[500],
        )
      ),
    );
  }
}