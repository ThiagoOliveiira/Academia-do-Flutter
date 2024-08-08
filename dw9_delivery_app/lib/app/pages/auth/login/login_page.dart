import 'package:dw9_delivery_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.login) {
          showLoader();
        } else if (state.status == LoginStatus.success) {
          hideLoader();
          Navigator.pop(context, true);
        } else if (state.status == LoginStatus.error) {
          hideLoader();
          showError('Erro ao realizar login!');
        } else if (state.status == LoginStatus.loginError) {
          hideLoader();
          showError('Login ou senha invãlidos!');
        } else {
          hideLoader();
        }
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login', style: context.textStyles.textTitle),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _emailEC,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: Validatorless.multiple(
                          [Validatorless.required('E-mail obrigatório'), Validatorless.email('E-mail inválido')],
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordEC,
                        decoration: const InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                        validator: Validatorless.multiple([Validatorless.required('Senha obrigatória')]),
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: DeliveryButton(
                          label: 'Entrar',
                          width: double.infinity,
                          onPressed: () {
                            final valid = _formKey.currentState?.validate() ?? false;

                            if (valid) {
                              controller.login(_emailEC.text, _passwordEC.text);
                            }
                          },
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
      ),
    );
  }
}
