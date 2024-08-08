import 'package:dw9_delivery_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import 'cubit/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.register) {
          showLoader();
        } else if (state.status == RegisterStatus.success) {
          hideLoader();
          showSuccess('Cadastrado com sucesso!');
          Navigator.pop(context);
        } else if (state.status == RegisterStatus.error) {
          hideLoader();
          showError('Erro ao registrar usuário');
        } else {
          hideLoader();
        }
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cadastre', style: context.textStyles.textTitle),
                  Text('Preencha os campos abaixo para cirar o seu cadastro', style: context.textStyles.textMedium.copyWith(fontSize: 18)),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _nameEC,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: Validatorless.required('Nome obrigatório'),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _emailEC,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _passwordEC,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validatorless.min(6, 'Senha deve conter pelo menos 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Confirma Senha'),
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirma senha obrigatória'),
                      Validatorless.compare(_passwordEC, 'As senhas não conferem'),
                    ]),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: DeliveryButton(
                      label: 'Cadastrar',
                      width: double.infinity,
                      onPressed: () {
                        final valid = _formKey.currentState?.validate() ?? false;

                        if (valid) {
                          controller.register(_nameEC.text, _emailEC.text, _passwordEC.text);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
