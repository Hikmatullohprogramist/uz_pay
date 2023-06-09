import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'constantas.dart';


Widget buildImage(String? url, bool images, [double? width, double? height, BoxFit? fit]){
  return CachedNetworkImage(
    imageUrl:  images ? "${BASE_URL}images/${url ??""}" : "$BASE_URL${url ??""}",
    width: width,
    height: height,
    fit: fit,
    errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red, size: 20),
    placeholder: (context, url) =>   const Center(child: SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(),
    ),

    ),

  );

}