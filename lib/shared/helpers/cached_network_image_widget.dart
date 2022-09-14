import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../widgets/is_loading_page.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String image;
  const CachedNetworkImageWidget({
    Key? key,
    required this.image,
    this.width = 65,
    this.height = 65,
    this.borderRadius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      placeholder: (context, url) => const IsLoadingPage(),
      errorWidget: (context, url, error) => Container(
        alignment: Alignment.center,
        child: const Text('erro'),
      ),
    );
  }
}
