import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(dio: context.read()),
          ),
          Provider(create: (context) => HomeController(context.read())),
        ],
        child: const HomePage(),
      );
}
