import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu/shared/helpers/snack_bar_helper.dart';
import 'package:mottu/shared/themes/default/default_theme.dart';
import 'package:mottu/src/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  HomeController controller = Get.put(HomeController(), tag: 'home');
  AppLifecycleState appLifecycleState = AppLifecycleState.detached;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    controller.errorMessage.listen((value) {
      if (value != '') {
        SnackbarHelper.showFailure(context, message: value);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      await controller.handleDeleteCache();
    }

    appLifecycleState = state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("I'm Mottu"),
          actions: [
            IconButton(
              onPressed: () async {
                await controller.getCharacters();
              },
              icon: const Icon(
                Icons.refresh_sharp,
              ),
            )
          ],
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                style: DefaultFontStyle.paragraphSmall.getText
                                    .copyWith(
                                  color: PalleteColor.grayPrimary,
                                ),
                                controller: controller.searchController.value,
                                scrollPadding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: PalleteColor.grayPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (controller
                                    .searchController.value.text.isEmpty) {
                                  SnackbarHelper.showFailure(
                                    context,
                                    message: 'Search field is required',
                                  );
                                } else {
                                  await controller.getSearchCharacters(
                                    search:
                                        controller.searchController.value.text,
                                  );
                                }
                              },
                              child: const Text('Search'),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                          itemCount: controller.charactersList.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
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
                  ],
                ),
        ));
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