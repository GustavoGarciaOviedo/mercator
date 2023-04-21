import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mercator/services/products_service.dart';
import 'package:mercator/widgets/widgets.dart';
import 'package:mercator/ui/input_decoration.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

 @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedProduct),
      child:_ProductScreenBody(productsService: productsService) ,
    );

    //return _ProductScreenBody(productsService: productsService);
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    super.key,
    required this.productsService,
  });

  final ProductsService productsService;

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
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
                        icon: Icon(Icons.arrow_back_ios_new,size: 40,color: Colors.black87,),
                        
                      ),
                    ),
                    Positioned(
                      right: 20, top: 40,
                      child: IconButton(
                        onPressed: (){
                          //TODO: acceder a la camara
                        },
                        icon: Icon(Icons.camera_alt_outlined, size: 40,color:  Colors.black87),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,//da una leve anomacion por que sta mas abajo que el boton de la otra pagina
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () async{
         if (!productForm.isValidForm()) return;//si no es valido no continue !
         await productsService.saveOrCreateProduct(productForm.product);

        }),
    );
  }
}

class _productForm extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        // height: 200, // importante quitarlo porque los mismos widgets le dan la dimension
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
          children: [
            SizedBox(height: 10,),
            TextFormField(
              initialValue: product.name,
              onChanged: (value) => product.name =  value,//me guarde en el producto.name lo qu eingrese en el texto
              validator: (value) {
                if (value == null || value.isEmpty  ) {// o bien podria ser .length < 1
                  return '   el nombre es obligatorio';
                }
              },
              decoration:  InputDecorations.authInputDecoration(
                labelText: 'nombre',
                hintText: 'nombre del producto', 
                prefixIcon: Icons.production_quantity_limits
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              initialValue: '${product.price}',// porque es un double se utiliza esta notacion
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
              ],
              //tengo que hacer la evaluacion por que no recibe un string, carpinteria
              onChanged: (value) => {// se hace todo esta form aporque espera un string y se l pasa un double
                double.tryParse(value) == null// si intenta parsear y no puede entonces o y si no lo que se ingrese como value
                ? product.price = 0
                : product.price = double.parse(value)
              },
              validator: (value) {
                if (value == null || value.isEmpty  ) {
                  return '   es recomendable poner un precio'; // parece que ya lo valido, lo dejo solo como recomendacion
                }
              },
              decoration:  InputDecorations.authInputDecoration(
                labelText: 'precio',
                hintText: 'precio del producto', 
                prefixIcon: Icons.monetization_on_outlined
              ),
              keyboardType: TextInputType.number,
            ),
             SizedBox(height: 10,),


            TextFormField(
              initialValue: '${product.discount}',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^([0-9]|[1-9][0-9]|100)$')),
              ],
              onChanged: (value) => {
                int.tryParse(value) == null
                ? product.discount = 0
                : product.discount = int.parse(value)
              },
              validator: (value) {
                if (value == null || value.isEmpty  ) {
                  return '    es recomendable poner un numero'; // parece que ya lo valido, lo dejo solo como recomendacion
                }
              },
              decoration:  InputDecorations.authInputDecoration(
                labelText: 'descuento 0 - 100 %',
                hintText: 'descuento del producto', 
                prefixIcon: Icons.discount_outlined
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20,)
            ,
            SwitchListTile.adaptive(
              value: product.available, 
              title: Text('Disponible'),
              onChanged: (value){//del provider llamo el metodoupdateavailability
                productForm.updateAvailability(value);
                
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


