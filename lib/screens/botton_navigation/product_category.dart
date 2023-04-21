import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(top: 0),//provisional la separacion
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            physics: BouncingScrollPhysics(),
          ),
          child:SingleChildScrollView(
                  child: Table(
                    children:  [
                      TableRow(
                        children: [
                          _SingleCard(color: Colors.red,texto: 'lacteos',icon: Icons.pets_outlined,),
                          _SingleCard(icon: Icons.grain_outlined, texto: 'granos',),
                          _SingleCard(),
                        ]
                      ),

                      TableRow(
                        children: [
                          _SingleCard(),
                          _SingleCard(color: Colors.red,texto: 'lacteos',icon: Icons.pets_outlined,),
                          _SingleCard(icon: Icons.grain_outlined, texto: 'granos',),
                        ]
                      ),

                      TableRow(
                        children: [
                          _SingleCard(color: Colors.red,texto: 'lacteos',icon: Icons.pets_outlined,),
                          _SingleCard(),
                          _SingleCard(icon: Icons.grain_outlined, texto: 'granos',),
                        ]
                      ),

                      TableRow(
                        children: [
                          _SingleCard(color: Colors.red,texto: 'lacteos',icon: Icons.pets_outlined,),
                          _SingleCard(icon: Icons.grain_outlined, texto: 'granos',),
                          _SingleCard(),
                        ]
                      ),

                      TableRow(
                        children: [
                          _SingleCard(),
                          _SingleCard(color: Colors.red,texto: 'lacteos',icon: Icons.pets_outlined,),
                          _SingleCard(icon: Icons.grain_outlined, texto: 'granos',),
                        ]
                      ),
                
                    ],
                  ),
                )
          )
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon ;
  final  String texto;
  final Color color;

  const _SingleCard({super.key, 
    this.icon =  Icons.delete_forever, 
    this.texto =  ('?'), 
    this.color = Colors.black}
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 150,
      decoration:_cardBorder(),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
          backgroundColor: Colors.amber[400],
          radius: 30.0,
          child: Icon(this.icon, size: 40, color: this.color,),
        ),
          SizedBox(height: 15,),
          Text(this.texto,style: TextStyle(color: this.color),),
        ]
      ),
    );
  }
}

  BoxDecoration _cardBorder() => BoxDecoration(
          color: Color.fromRGBO(254, 253, 254, 0.99),//no estoy usando este color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black45,
                blurRadius: 0.5, //ancho de la sombra en degrade
                offset: Offset(1, 2) // este da el direccionamiento
                )
          ]);


 