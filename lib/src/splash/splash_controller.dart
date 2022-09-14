import 'package:get/get.dart';

class SplashController extends GetxController {
  goToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.toNamed('/home');
      },
    );
  }

  @override
  void onInit() {
    goToHome();
    super.onInit();
  }
}
