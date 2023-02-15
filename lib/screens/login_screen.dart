import 'package:flutter/material.dart';
import 'package:mercator/providers/login_form_provider.dart';
import 'package:mercator/ui/input_decoration.dart';
import 'package:mercator/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  

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
                    
                    //envuelvo el loginform porque es donde unicamente lo necesito, me relaciona el lugar 
                    //donde tengo el  provider con el lugar donde lo necesito
                    ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      child: _LoginForm(),)
                    
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
  

  @override
  Widget build(BuildContext context) {

//de esta manera ya puedo accerder al contenido de la clase provider
    final  loginForm =Provider.of<LoginFormProvider>(context);//TODO:  es el lamado , pilas
    return Container(
      child: Form(
        key: loginForm.formKey,//accedo al formKey que esta en el provider con eso queda relacionado
        //TODO:MANTENER LA REFERNCIA AL KEY  del metodo constructor
        autovalidateMode: AutovalidateMode.onUserInteraction,//cuando el user interactue se vera el validaror.. ver mas abajo el validator
        child: Column(
          children: [
            TextFormField(//este es le campo a llenar
              autocorrect: false,//como es un correo no quiero correccion sugerencias de ortografia
              keyboardType: TextInputType.emailAddress,//de que tipo va a ser el ingreso
              decoration:  InputDecorations.authInputDecoration(
                labelText: 'email',
                hintText: 'tucorreo@mail.com', 
                prefixIcon: Icons.alternate_email_rounded
              ),//importo la clase con el metodo estatico, queme trae la decoracion(estos anteriores son parametros jaa)
              onChanged: ((value) => loginForm.email=value),//de esta manera cuando exista un cambio en el input esto lo relacionara con el provider
              validator: (value) {

                  //la siguente es una expresion regular
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                  ? null
                  : 'tipo de correo erroneo';
                },
            ),
            const SizedBox(height: 20,),
            TextFormField(//este es le campo a llenar
              autocorrect: false,//como es un correo no quiero correccion sugerencias de ortografia
              obscureText: true, //oculta los carcteres de la contraseña
              keyboardType: TextInputType.emailAddress,//de que tipo va a ser el ingreso
              decoration:  InputDecorations.authInputDecoration(
                labelText: 'password',
                hintText: 'xxxx', 
                prefixIcon: Icons.key_rounded
              ),
              onChanged: (value) => loginForm.password=value,
                
              validator: (value) {
                  if (value != null && value.length >=6) return null;
                  return 'la contraseña debe tener minimo 6 caracteres';
              },

                //importo la clase con el metodo estatico, qu eme trae la decoracion
            ),
            const SizedBox(height: 20),

            // this is a button ñee
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),//mucha cosas para redondear le borde
              disabledColor: Colors.pink[50],
              color: Color.fromARGB(255, 227, 42, 202),
              elevation: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                child: Text(
                  loginForm.isLoading//para que el texto del boton refleje el estado del formulario
                  ?'espere'
                  :'ingresar', 
                  style: TextStyle(color: Colors.white ),),
              ),
              onPressed: loginForm.isLoading ? null: () async {

                FocusScope.of(context).unfocus();//quita el teclado virtual después de que el usuario ha terminado de ingresar información.
                //ahora voy a utilizarlo para que me pueda enviar a otra ruta
                if(!loginForm.isValidForm())return;//puedo llamarlo porque dentro del scope esta el provider, ver linea 54 aprox
               
                loginForm.isLoading =  true; //cuando se oprima el boton y se cumplan las validaciones cambia a 
                //true y entonces se muestra el texto 'espere'en el boton 

                await Future.delayed(Duration(seconds: 2));

                loginForm.isLoading =  false;

                Navigator.pushReplacementNamed(context, 'home');
                //no recordar que la funcion anterior mata la pagina es decir ya no se retorna a ella
              //LO ANTERIOR si no es verdadero que se quede donde esta, si es verdadero es decir se cumplen las 
              //condicones del formulario entonces me redirige a otra pagina que para el caso es home
                
              })
          ],
        )),
    );
  }
}

