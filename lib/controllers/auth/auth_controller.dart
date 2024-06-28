import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import '../../data/models/auth/login_res_model.dart';
import '../../data/repository/auth_repository.dart';

class AuthenticationController extends GetxController {
  final AuthRepository authRepository;

  AuthenticationController({required this.authRepository});

  //get isAdmin => null;

  @override
  void onReady() {
    checkUserLoggedIn();
    super.onReady();
  }

  void login({required String email, required String password}) async {
    final res =
        await authRepository.loginUser(email: email, password: password);
    res.fold(
      (left) => Get.snackbar("Error Occurred", left.toString()),
      (right) {
        saveToken(token: right.accessToken!);
        final user = right.user; // Access the user object
        checkUserLoggedIn(); // Pass the user object
        Get.offAllNamed('/main');
        print(right);
      },
    );
  }

  /// save token to local storage and navigate to home screen if user is logged in before
  /// and token is not expired

  void checkUserLoggedIn() async {
    final token = await GetStorage().read("token");
    if (token != null) {
      Get.offAllNamed("/main");

      ///all of name = remove all of the previous route
    } else {
      Get.offAllNamed("/login");
    }
  }

  // save token to local storage
  void saveToken({required String token}) async {
    await GetStorage().write("token", token);
  }
}
