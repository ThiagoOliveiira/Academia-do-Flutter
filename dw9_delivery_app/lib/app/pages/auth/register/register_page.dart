import 'package:dw9_delivery_app/app/app.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cadastre', style: context.textStyles.textTitle),
                Text('Preencha os campos abaixo para cirar o seu cadastro', style: context.textStyles.textMedium.copyWith(fontSize: 18)),
                const SizedBox(height: 30),
                TextFormField(decoration: const InputDecoration(labelText: 'Nome')),
                const SizedBox(height: 30),
                TextFormField(decoration: const InputDecoration(labelText: 'E-mail')),
                const SizedBox(height: 30),
                TextFormField(decoration: const InputDecoration(labelText: 'Senha')),
                const SizedBox(height: 30),
                TextFormField(decoration: const InputDecoration(labelText: 'Confirma Senha')),
                const SizedBox(height: 50),
                Center(
                  child: DeliveryButton(
                    label: 'Cadastrar',
                    width: double.infinity,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
