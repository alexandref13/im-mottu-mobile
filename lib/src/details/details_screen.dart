import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mottu/shared/helpers/cached_network_image_widget.dart';
import 'package:mottu/shared/themes/default/default_fonts_style.dart';
import 'package:mottu/shared/themes/default/default_pallete.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //NOTE -> Args recebe name and imageThumbnail
    var args = Get.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                CachedNetworkImageWidget(
                  image:
                      '${args['imageThumbnail'].path}.${args['imageThumbnail'].extension}',
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(height: 8),
                Text(
                  args['name'],
                  style: DefaultFontStyle.headingSmall.getText.copyWith(),
                ),
                const SizedBox(height: 4),
                Text(
                  args['description'] == ''
                      ? 'This character has no description'
                      : args['description'],
                  style: DefaultFontStyle.paragraphSmall.getText.copyWith(
                    color: args['description'] == ''
                        ? PalleteColor.mainColor
                        : PalleteColor.grayPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
