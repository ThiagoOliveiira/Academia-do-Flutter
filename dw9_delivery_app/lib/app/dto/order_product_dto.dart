import 'package:dw9_delivery_app/app/app.dart';

class OrderProductDTO {
  final ProductModel product;
  final int amount;

  OrderProductDTO({required this.product, required this.amount});

  double get totalPrice => amount * product.price;
}
