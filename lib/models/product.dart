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
        this.picture,
        required this.price,
        this.id

    });

    bool available;
    String name;
    String? picture;
    double price;
    String? id;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
    };


//hago una copia porque no quiero alterar mi producto cuando se pasen los valores a la otra pagina
    Product copy () => Product(
        available: this.available,
        name: this.name,
        picture: this.picture,
        price: this.price,
        id: this.id
    
    );
}
