import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [Provider(create: (context) => ProductDetailController())],
        builder: (context, child) {
          final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
          return ProductDetailPage(product: args['product'], order: args['order']);
        },
      );
}
