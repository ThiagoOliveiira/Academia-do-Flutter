import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dw9_delivery_app/app/app.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  const AuthRepositoryImpl({required this.dio});

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unauth().post('/auth', data: {'email': email, 'password': password});

      return AuthModel.fromMap(result.data);
    } on DioException catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);

      throw const RepositoryException(message: 'Erro ao realizar login');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unauth().post('/users', data: {'name': name, 'email': email, 'password': password});
    } on DioException catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);

      if (e.response?.statusCode == 403) {
        log('Permissão negada', error: e, stackTrace: s);
        throw UnauthorizedException();
      }

      throw const RepositoryException(message: 'Erro ao registrar usuário');
    }
  }
}
