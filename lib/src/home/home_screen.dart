import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu/shared/helpers/snack_bar_helper.dart';
import 'package:mottu/shared/themes/themes.dart';
import 'package:mottu/src/Home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    controller.errorMessage.listen((value) {
      if (value != '') {
        SnackbarHelper.showFailure(context, message: value);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(PalleteColor.mainColor),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.charactersList.length,
                itemBuilder: ((_, i) {
                  var character = controller.charactersList[i];

                  return ListTile(
                    title: Text(character.name!),
                  );
                }),
              ),
      ),
    );
  }
}
