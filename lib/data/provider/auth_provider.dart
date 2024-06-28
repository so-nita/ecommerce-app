import 'dart:io';
import 'package:a2ecommerceapp/constants/constant.dart';
import 'package:a2ecommerceapp/data/models/auth/login_res_model.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class AuthProvider {
  final Dio _dio = Dio();

  Future<Either<String, LoginResModel>> loginUser({
    required String email,
    required String password,
    // required bool isAdmin,
  }) async {
    {
      try {
        final formData = FormData.fromMap({
          'email': email,
          'password': password,
        });
        final res = await _dio.post(
          '$kBaseUrl/auth/login',
          data: formData,
          options: Options(
              headers: {
                'Accept': 'application/json',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }),
        );
        //print(res.data);
        if (res.statusCode == 200) {
          return Right(LoginResModel.fromJson(res.data));
        } else {
          return Left(res.data['message']);
        }
      } catch (e) {
        return Left(e.toString());
      }
    }
  }
}
