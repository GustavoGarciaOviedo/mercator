// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);


//ES LA CONVERSION QUE HAGO AL JSON QUE OBTUVE DE LA CREACION DE LA BBDD FIREBASE Y QUE 
//CONVERTI A LENGUAJE DART EN QUICKTYPE 
import 'dart:convert';

class Product {
    Product({
        required this.available,
        required this.name,
        this.discount,
        this.picture,
        required this.price,
        this.id

    });

    bool available;
    int? discount;
    String name;
    String? picture;
    double price;
    String? id;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        discount: json["discount"]?.toInt(),
        name: json["name"],
        picture: json["picture"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "discount": discount,
        "name": name,
        "picture": picture,
        "price": price,
    };


//hago una copia porque no quiero alterar mi producto cuando se pasen los valores a la otra pagina
    Product copy () => Product(
        available: available,
        discount: discount,
        name: name,
        picture: picture,
        price: price,
        id: id
    
    );
}


/*El constructor Product toma los valores de available, discount, name, picture, y price y crea una nueva 
instancia de Product. El constructor fromJson toma una cadena JSON y la convierte en una instancia de Product. 
El método toJson convierte la instancia de Product en una cadena JSON. El método toMap convierte la 
instancia de Product en un mapa de claves y valores para que se pueda utilizar en diferentes formatos de datos.

este código se utiliza para manejar datos de productos en un formato JSON.  */