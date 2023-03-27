import 'package:flutter/material.dart';
import 'package:mercator/models/product.dart';

//el contenido que tiene la tarjeta del home
class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({super.key, required this.product});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 50),
          width: MediaQuery.of(context).size.width * 0.6 ,
          height: 300,
          decoration: _cardBorder(),
          child: Stack(
            children: [
              _BackgroundImage(product.picture),
              //estos container para darle la ubicacion a cada uno de los widges estraidos 
              Positioned(bottom: 0,left: 0,
                //alignment: FractionalOffset.bottomLeft,
                child: _ProductDetail(title: product.name, subtitle: product.id!,)
              ),
              Positioned(top: 0,right: 0,
                child: _PriceTag(product.price),
              ),
      
              if (!product.available)
              Positioned(top: 0,left: 0,
                child: _NotAvailable(),
              ),
            ],
          ),
          
          //color: Color.fromARGB(255, 238, 30, 15),
        ),
      ),
    );
  }

//esta es la tareta que voy a utilizar como base
  BoxDecoration _cardBorder() => BoxDecoration(
          color: Colors.red[600],//no estoy usando este color
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 2, //ancho de la sombra en degrade
                offset: Offset(1, 4) // este da el direccionamiento
                )
          ]);
}


//TODO: mostrar de manera condisional si esta disponible o no el producto
class _NotAvailable extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: _buildBoxDecoration(tl: 25, br: 25, color: Colors.amber),
      width: size.width * .3,
      height: size.height* .07,
      child: FittedBox(//para ajustar el contenido segun el espacio que tenga en el widget 
        fit: BoxFit.contain,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
          'no disponible',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

//imagen de fondo,, la veria como la tarjeta superpuesta
class _BackgroundImage extends StatelessWidget {
   final String? url;

  const _BackgroundImage( this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // para darle los mismos bordes que a la tarjeta del fondo
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,//solo esta de guia porque al poner la imagen se cubre
        child: url == null //TODO: utilizo este condicional ternario en caso que no exista la foto
        ? Image(
          image: AssetImage('assets/no-image.png'), 
          // fit: BoxFit.cover,
          )
        :
         FittedBox(//este me pone la imagen tal cual completa
           child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(url!),
            fit: BoxFit.cover, //para quye la imagen utilice todo el campo del widget
                 ),
         ),
      ),
    );
  }
}

//parte superior donde se encuentra el precio
class _PriceTag extends StatelessWidget {
  final double valor;

  const _PriceTag( this.valor);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FittedBox(
      
      child: Container(
        
        decoration: _buildBoxDecoration(tr: 25, bl: 25, color: Colors.green),
        width: size.width * .3,
        height: size.height* .07,
        child: FittedBox(//para ajustar el contenido segun el espacio que tenga en el widget 
          fit: BoxFit.contain,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
            '$valor \$',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

//detalles del producto
class _ProductDetail extends StatelessWidget {

  final String title;
  final String subtitle;

  const _ProductDetail({ required this.title, required this.subtitle});//con las llaves se envian por nombre
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      alignment: FractionalOffset.bottomLeft,
      width: size.width * .5,
      height: size.height* .07,
      decoration: _buildBoxDecoration(bl: 25, tr: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FittedBox(
              child: Text(
                title,
                style: TextStyle(fontSize: 30, color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          
          Expanded(
            child: FittedBox(
              child: Text(
                subtitle,
                style: TextStyle(fontSize: 20, color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}

BoxDecoration _buildBoxDecoration(//los valores de los argumentos estan preasignados en caso de que no se envie parametros
        {double tr = 0,
        double tl = 0,
        double br = 0,
        double bl = 0,
        Color color = Colors.red}) =>
    BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(tl),
        bottomRight: Radius.circular(br),
        topRight: Radius.circular(tr),
        bottomLeft: Radius.circular(bl),
      ),
      
    );
