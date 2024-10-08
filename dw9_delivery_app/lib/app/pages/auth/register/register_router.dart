import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'register.dart';

class RegisterRouter {
  RegisterRouter._();

  static Widget get page => MultiProvider(providers: [
        Provider(create: (context) => RegisterController(context.read())),
      ], child: const RegisterPage());
}
