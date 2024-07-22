import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/assets.dart';

class CustomImage extends StatelessWidget {
  CustomImage(
      {super.key,
        required this.url,
        this.width = double.infinity,
        this.fit = BoxFit.cover,  this.height});

  final String url;
  final double? width;
  final double? height;

  final BoxFit fit;
  bool hasHeight = false;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: url,
      placeholder: (context, url) =>
      const Image(image: AssetImage(Assets.placeholder), fit: BoxFit.cover),
      errorWidget: (context, url, error) =>
      const Image(image: AssetImage(Assets.placeholder), fit: BoxFit.cover),
    );
  }
}
