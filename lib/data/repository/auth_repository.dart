import 'dart:io';

import 'package:a2ecommerceapp/data/models/auth/login_res_model.dart';
import 'package:a2ecommerceapp/data/provider/auth_provider.dart';
import 'package:either_dart/either.dart';

class AuthRepository {
  final AuthProvider authProvider;

  AuthRepository({required this.authProvider});

  Future<Either<String, LoginResModel>> loginUser({
    required String email,
    required String password,
  }) async {
    {
      return authProvider.loginUser(email: email, password: password);
    }
  }
}
