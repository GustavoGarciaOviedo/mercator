import 'package:flutter/material.dart';
import 'package:mercator/providers/theme_provider.dart';
import 'package:mercator/share_preferences/preferences.dart';
import 'package:mercator/widgets/side_menu.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static String routeName = 'SettingScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode =  false;
  // int gender = 1;
  // String name = 'pedro';

  @override
  Widget build(BuildContext context) {
    
  final themeProvider =Provider.of<ThemeProvider>(context, listen: false);//para escuchar el cambio de estado

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        //controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ajustes', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),),
            // Divider( color: Colors.black,),
            SwitchListTile.adaptive(
              value: Preferences.isDarkModeGet, 
              title: Text('modeDark'),
              onChanged: (value){//la variable isdarkmode va obterne el valor del parametro y lo pasara como valor al value, con el set state se mantiene
                Preferences.isDarkModeSet=value;
                value //condiciono com quiero que se cambie segun si esta encendido o no el switch(esto es por el provider)
                  ? themeProvider.setDarkMode() 
                  : themeProvider.setLightMode();
                setState(() {});
              }),
              Divider(),
              RadioListTile<int>(//es mejor espcificar el tipo de dato que recibe
                title: Text('Maculino'),
                value: 1, 
                groupValue: Preferences.genderGet, 
                onChanged: (value){
                  Preferences.genderSet=value ?? 1;
                  setState(() {});
                }),
              Divider(thickness: 1,),
              RadioListTile<int>(//es mejor espcificar el tipo de dato que recibe
                title: Text('Femenino'),
                value: 2, 
                groupValue: Preferences.genderGet, 
                onChanged: (value){
                  Preferences.genderSet=value ?? 2;
                  setState(() {});
                }),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.nameGet,
                  onChanged: (value){
                    Preferences.nameSet=value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: 'nombre',
                    helperText: 'nombre del usuario'
                  ),
                  
                ),
              )
          ],
        ),
      ),
      //bottomNavigationBar: CustomBottonNavigator(),
    );
  }
}