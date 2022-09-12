import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu/src/details/details_screen.dart';

import 'shared/themes/themes.dart';
import 'src/home/home.dart';

void main() {
  runApp(GetMaterialApp(
    theme: DefaultTheme().getTheme,
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    getPages: [
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
