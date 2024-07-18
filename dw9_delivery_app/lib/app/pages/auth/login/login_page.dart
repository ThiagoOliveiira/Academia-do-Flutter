import 'package:dw9_delivery_app/app/app.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login', style: context.textStyles.textTitle),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Senha'),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: DeliveryButton(
                        label: 'Entrar',
                        width: double.infinity,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Não possui uma conta', style: context.textStyles.textBold.copyWith(color: Colors.black)),
                    TextButton(
                      onPressed: () => Navigator.of(context).pushNamed('/auth/register'),
                      child: Text('Cadastre-se', style: context.textStyles.textBold.copyWith(color: Colors.blue)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
