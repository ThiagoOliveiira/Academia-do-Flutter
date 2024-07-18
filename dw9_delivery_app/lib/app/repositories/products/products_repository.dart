import '../../models/models.dart';

abstract interface class ProductsRepository {
  Future<List<ProductModel>> findAllProducts();
}
