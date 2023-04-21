import 'package:flutter/material.dart';
import 'package:mercator/models/product.dart';
import 'package:mercator/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

//el contenido que tiene la tarjeta del home,, IMAGENES DE LOS PRODUCTOS
class ProductCard extends StatelessWidget {

  final Product product;
  
  const ProductCard({super.key, required this.product});
  

  @override
  Widget build(BuildContext context) {

     
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width * 0.6 ,
          height: 400,
          decoration: _cardBorder(),
          child: Stack(
            children: [
             _BackgroundImage(product.picture,product),//TODO: pilas porque pase un parametro para hacer el condicional del descuento para los productos disponobles no mas
            //  if (product.available) //lo tenia pero se dificulta ubicarlo con el stack de la imagen
            //   ProductDiscount(), 
              product.available 
              ? IconAdd() 
              : _NotAvailable(),
              ProductInfo(price: product.price, description: product.name, )
              
            ],
          ),
          
          
        ),
      ),
    );
  }

//esta es la tareta que voy a utilizar como base
  BoxDecoration _cardBorder() => BoxDecoration(
          color: Colors.white,//no estoy usando este color
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 2, //ancho de la sombra en degrade
                offset: Offset(1, 4) // este da el direccionamiento
                )
          ]);
}




//imagen de fondo,, la veria como la tarjeta superpuesta
//TODO: Restingirle el tamaño par auqe sean iguales y se acomoden
class _BackgroundImage extends StatelessWidget {
   final String? url;
   final Product? product;
   
  const _BackgroundImage( this.url, this.product,);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      // para darle los mismos bordes que a la tarjeta del fondo
      borderRadius: BorderRadius.circular(25),
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height*.12),//para que no quede en el centro absoluto
        child: Center(
          child: Stack(
            children: [
              Container(    
                alignment: Alignment.center,
                  width: double.infinity,
                  height: size.height*.2,
                  //color: Colors.red,//solo esta de guia porque al poner la imagen se cubre
                  child: url == null //TODO: utilizo este condicional ternario en caso que no exista la imagen
                  ? Image(
                    image: AssetImage('assets/no-image.png'), 
                    fit: BoxFit.cover,
                    )
                  : FadeInImage(
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(url!),
                    fit: BoxFit.cover, //para quye la imagen utilice todo el campo del widget
                        ),
              ),
              if (product?.available == true && product!.discount != null && product!.discount! > 0) //es la regla para condicionar que no est eagotado y que tenga un descuento para mostrar la banda de descuento
                ProductDiscount(discount: product?.discount,), //TODO: a ver que pasa si no le pongo nada
                
            ]
          ),
        ),
      ),

    );
  }
}



class _NotAvailable extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        decoration: _buildBoxDecoration(tl: 25, br: 25, color: Colors.amber),
        width: size.width * .2,
        //height: size.height* .07,
        child: FittedBox(//para ajustar el contenido segun el espacio que tenga en el widget 
          fit: BoxFit.contain,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Text(
            'Agotado',
            style: TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
          )),
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



class ProductDiscount extends StatelessWidget {

  final int? discount;
  const ProductDiscount({Key? key,  this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromARGB(223, 232, 32, 192),
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(3)),
          boxShadow: [
            BoxShadow(
                color: Colors.red,//parece que se activa en el fondo y como exuste transparencia alcanza a hacer un buen contraste
                // blurRadius: 0.1, //ancho de la sombra en degrade
                // offset: Offset(0.5, 0.41), // este da el direccionamiento
                // spreadRadius: 0.05
                )
          ]

        ),
        child: Text(
          ' -$discount %',
          style: TextStyle(
            //fontFamily: 'Montserrat',//esta por defecto el stilo
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}



class ProductInfo extends StatelessWidget {
  final double? price;
  final String? description;
  

  const ProductInfo({
    super.key,  this.price, this.description, 
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(

        margin: EdgeInsets.symmetric(horizontal: 15,vertical: size.height*0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('\$ $price',style: TextStyle(fontSize: 25, color: Colors.purple,fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
              
          Text('$description',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          
        ],),
      ),
    );
  }
}
