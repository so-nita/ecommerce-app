import 'package:a2ecommerceapp/binding/auth/binding.dart';
import 'package:a2ecommerceapp/views/screens/Dashboard/dashboard_screen.dart';
//import 'package:a2ecommerceapp/views/screens/admin/adminScreen.dart';
import 'package:a2ecommerceapp/views/screens/authScreens/loginScreen.dart';
import 'package:a2ecommerceapp/views/screens/home/homeScreen.dart';
import 'package:a2ecommerceapp/views/screens/splahscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'binding/dashboard/dashboard_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash', //original splash
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/main',
          page: () => const DashboardScreen(),
          binding: DashboardBinding(),
        ),
        // GetPage(
        //   name: '/admin',
        //   page: () => const AdminScreen(),
        // ),
      ],
      // home: SplashScreen(),
    );
  }
}
