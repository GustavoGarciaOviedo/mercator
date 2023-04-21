import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProductHome extends StatelessWidget {
  const ProductHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        physics: BouncingScrollPhysics(),
      ),
      child:SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 50,),
            MyCardSwiper(),
            SizedBox(height: 30,),
            ListProduct(),
            // _DataUser(),//TODO: usar esos datos para poner el nombre al usuario y posiblemente al avatar
            ListProduct(),
             SizedBox(height: 80,),
             
          ],),
        ),
    );
  }
}