import 'package:a2ecommerceapp/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    // Get.put() => HomeController();
    //  Get.put(HomeController());
  }
}
