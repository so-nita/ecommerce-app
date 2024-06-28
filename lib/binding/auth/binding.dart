import 'package:a2ecommerceapp/controllers/auth/auth_controller.dart';
import 'package:a2ecommerceapp/data/provider/auth_provider.dart';
import 'package:get/get.dart';

import '../../data/repository/auth_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthenticationController(
        authRepository: AuthRepository(authProvider: AuthProvider()),
      ),
    );
  }
}
