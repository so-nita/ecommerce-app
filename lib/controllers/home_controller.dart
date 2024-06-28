// //mport 'dart:html';
//
// import 'package:a2ecommerceapp/data/models/banner/banner_res_model.dart';
// import 'package:a2ecommerceapp/data/provider/banner_provider.dart';
// import 'package:get/get.dart';
//
// class HomeController extends GetxController {
//   static HomeController instance =
//       Get.find(); // Access controller using 'HomeController.to'
//
//   RxList<AdBanner> bannerList = <AdBanner>[].obs; // Initialize as empty RxList
//   RxBool isBannerLoading = false.obs;
//
//   bool get isLoading => isBannerLoading.value;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getAdBanners(); // Fetch banners when controller initializes
//   }
//
//   void getAdBanners() async {
//     try {
//       isBannerLoading(true);
//       var result = await BannerProvider().fetchProducts();
//       bannerList.assignAll(adBannerListFromJson(result as String));
//     } finally {
//       isBannerLoading(false);
//     }
//   }
// }
