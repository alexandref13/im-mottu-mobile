import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu/shared/helpers/snack_bar_helper.dart';
import 'package:mottu/shared/themes/default/default_pallete.dart';
import 'package:mottu/src/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController(), tag: 'home');

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
        title: const Text("I'm Mottu"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: GridView.builder(
                        itemCount: controller.charactersList.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                        ),
                        itemBuilder: (_, i) {
                          var character = controller.charactersList[i];
                          return InkWell(
                            splashColor: PalleteColor.white,
                            onTap: () {
                              Get.toNamed('/details', arguments: {
                                'name': character.name,
                                'imageThumbnail': character.thumbnail,
                                'description': character.description,
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    '${character.thumbnail!.path}.${character.thumbnail!.extension}',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    character.name!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
          ),
        ],
      ),
    );
  }
}

// ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: controller.charactersList.length,
//                       itemBuilder: ((_, i) {
//                         var character = controller.charactersList[i];

//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Card(
//                             color: const Color(0xffa82823),
//                             child: Row(
//                               children: [
//                                 Image.network(
//                                   "${character.thumbnail!.path}.${character.thumbnail!.extension}",
//                                   width: 80,
//                                   height: 80,
//                                   fit: BoxFit.fill,
//                                 ),
//                                 Text(character.name!)
//                               ],
//                             ),
//                           ),
//                         );
//                       }),
//                     ),