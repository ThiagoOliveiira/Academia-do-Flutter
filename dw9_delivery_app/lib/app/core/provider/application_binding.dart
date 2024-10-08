import 'package:dw9_delivery_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CustomDio()),
        Provider<AuthRepository>(create: (context) => AuthRepositoryImpl(dio: context.read())),
      ],
      child: child,
    );
  }
}
