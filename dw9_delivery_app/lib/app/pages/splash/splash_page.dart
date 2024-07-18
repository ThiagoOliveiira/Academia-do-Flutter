import 'package:dw9_delivery_app/app/app.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset('assets/images/lanche.png', fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: context.percentHeight(.30)),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: context.percentHeight(.08)),
                  DeliveryButton(
                    label: 'Acessar',
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/home');
                    },
                    width: context.percentWidth(.6),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
