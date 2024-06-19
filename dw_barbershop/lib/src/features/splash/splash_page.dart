import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Loader'),
          onPressed: () async => await Future.delayed(const Duration(seconds: 2)).asyncLoader(),
        ),
      ),
    );
  }
}
