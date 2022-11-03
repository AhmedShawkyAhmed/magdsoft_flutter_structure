import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel({

    required this.company,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.type,
  });
  final int id;
  final String name, company, type, price, image, description;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(

        company: json['company'],
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        description: json['description'],
        type: json['type']);
  }

  @override
  List<Object?> get props => [

        company,
        id,
        name,
        image,
        price,
        description,
        type,
      ];
}
