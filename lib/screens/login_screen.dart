import 'package:flutter/material.dart';
import 'package:mercator/ui/input_decoration.dart';
import 'package:mercator/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(//si los hios sobrepasan las medidas del widge=> hacer scroll
          //controller: controller,
          child: Column(
            children: [
              SizedBox(height:230),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text('login',style: Theme.of(context).textTheme.headline5,),
                    SizedBox(height:20),
                    _LoginForm()
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Text('Crear una nueva cuenta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      )
    );
  }
}


//CUADRO DE LOGIN
class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //TODO:MANTENER LA REFERNCIA AL KEY  del metodo constructor
        child: Column(
          children: [
            TextFormField(//este es le campo a llenar
              autocorrect: false,//como es un correo no quiero correccion sugerencias de ortografia
              keyboardType: TextInputType.emailAddress,//de que tipo va a ser el ingreso
              decoration:  InputDecorations.authInputDecoration()//importo la clase con el metodo estatico, qu eme trae la decoracion
            )
          ],
        )),
    );
  }
}