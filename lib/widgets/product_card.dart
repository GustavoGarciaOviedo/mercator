import 'package:flutter/material.dart';

//el contenido que tiene la tarjeta del home
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorder(),
        child: Stack(
          children: [
            _BackgroundImage(),
            Container(
                alignment: FractionalOffset.bottomLeft,
                child: _ProductDetail()),
            Container(
                alignment: FractionalOffset.topRight, 
                child: _PriceTag()),

            Container(
                alignment: FractionalOffset.topLeft, 
                child:  _NotAvailable()),

           
          ],
        ),
        //color: Color.fromARGB(255, 238, 30, 15),
      ),
    );
  }

//esta es la tareta que voy a utilizar como base
  BoxDecoration _cardBorder() => BoxDecoration(
          color: Colors.amber[600],
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
      height: 70,
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
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // para darle los mismos bordes que a la tarjeta del fondo
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        color: Colors.green,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit
              .cover, //para quye la imagen utilice todo el campo del widget
        ),
      ),
    );
  }
}

//parte superior donde se encuentra el precio
class _PriceTag extends StatelessWidget {
  const _PriceTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: _buildBoxDecoration(tr: 25, bl: 25, color: Colors.green),
      width: size.width * .3,
      height: 70,
      child: FittedBox(//para ajustar el contenido segun el espacio que tenga en el widget 
        fit: BoxFit.contain,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
          '35000 \$',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

//detalles del producto
class _ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      alignment: FractionalOffset.bottomLeft,
      width: size.width * 0.7,
      height: 70,
      decoration: _buildBoxDecoration(bl: 25, tr: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'hard disk ',
            style: TextStyle(fontSize: 30, color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            ' id',
            style: TextStyle(fontSize: 20, color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
