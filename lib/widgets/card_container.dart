import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(//envuelto es este padiin para signarle los bordes
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        //height: 300, // no lo requiero por que segun los widges que pongan ellos daran el height
        decoration: _createCardShape(),
        child: this.child ,//me va a retornar como hijo (child) el child de variable que cree
      ),
    );
  }


//solo para la decoracion de ese container
  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 15,
        offset: Offset(3,8),
      )
    ]

  );
}