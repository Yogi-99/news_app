import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../global/resources/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;

  const CustomNetworkImage({
    Key key,
    @required this.imageUrl,
  })  : assert(imageUrl != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: KGreyColor.withOpacity(.5),
      ),
      errorWidget: (context, url, error) => Container(
        color: KGreyColor,
      ),
    );
  }
}
