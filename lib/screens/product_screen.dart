import 'package:flutter/material.dart';
import 'package:mercator/services/products_service.dart';
import 'package:mercator/widgets/widgets.dart';
import 'package:mercator/ui/input_decoration.dart';
import 'package:provider/provider.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

 @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
                child: Stack(
                  children: [
                    ProductImage(url: productsService.selectedProduct.picture),//es una clase
                    Positioned(//ubicacion sobre el widget que tiene con respecto a los valores que vaya a indicar
                      left: 20, top: 40,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),//ir atras
                        icon: Icon(Icons.arrow_back_ios_new,size: 40,color: Colors.white,),
                        
                      ),
                    ),
                    Positioned(
                      right: 20, top: 40,
                      child: IconButton(
                        onPressed: (){
                          //TODO: acceder a la camara
                        },
                        icon: Icon(Icons.camera_alt_outlined, size: 40,color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _productForm(),
            SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,//da una leve anomacion por que sta mas abajo que el boton de la otra pagina
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: (){
          // TODO:guardar producto
        }),
    );
  }
}

class _productForm extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        // height: 200, // importante quitarlo porque los mismos widgets le dan la dimension
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
          children: [
            SizedBox(height: 10,),
            TextFormField(
              decoration:  InputDecorations.authInputDecoration(
                labelText: 'nombre',
                hintText: 'nombre del producto', 
                prefixIcon: Icons.production_quantity_limits
              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              decoration:  InputDecorations.authInputDecoration(
                labelText: 'precio',
                hintText: 'precio del producto', 
                prefixIcon: Icons.monetization_on_outlined
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30,)
            ,
            SwitchListTile.adaptive(
              value: true, 
              title: Text('Disponible'),
              onChanged: (value){
                //TODO: pendiente activar o no boton
              }),
            SizedBox(height: 30,),
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45)),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 10, //ancho de la sombra en degrade
        offset: Offset(0, 4) // este da el direccionamiento
      )
    ],
  );
}


