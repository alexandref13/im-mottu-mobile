import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu/src/details/details_screen.dart';

import 'shared/themes/themes.dart';
import 'src/home/home.dart';
import 'src/splash/splash.dart';

void main() {
  runApp(GetMaterialApp(
    theme: DefaultTheme().getTheme,
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(
        name: '/',
        page: () => const SplashPage(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: '/home',
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: '/details',
        page: () => const DetailsScreen(),
      ),
    ],
  ));
}
