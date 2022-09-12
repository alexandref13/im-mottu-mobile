import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Image.network(
              '${args['imageThumbnail'].path}.${args['imageThumbnail'].extension}',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              args['name'],
              style: DefaultFontStyle.paragraphLarge.getText.copyWith(),
            ),
            const SizedBox(height: 4),
            Text(
              args['description'] == ''
                  ? 'This character has no description'
                  : args['description'],
              style: DefaultFontStyle.caption.getText.copyWith(
                  color: args['description'] == ''
                      ? PalleteColor.mainColor
                      : PalleteColor.black),
            ),
          ],
        ),
      ),
    );
  }
}
