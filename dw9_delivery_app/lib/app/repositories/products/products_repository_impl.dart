import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';

import '../../core/core.dart';
import './products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;

  const ProductsRepositoryImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw const RepositoryException(message: 'Erro ao buscar produtos');
    }
  }
}
