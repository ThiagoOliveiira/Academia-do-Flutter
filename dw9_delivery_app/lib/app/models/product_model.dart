// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;

  ProductModel({required this.id, required this.name, required this.description, required this.price, required this.image});

  Map<String, dynamic> toMap() => <String, dynamic>{'id': id, 'name': name, 'description': description, 'price': price, 'image': image};

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(id: map['id'], name: map['name'], description: map['description'], price: map['price'], image: map['image']);
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
