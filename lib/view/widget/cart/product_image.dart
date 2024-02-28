import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';

class CartProductImage extends StatelessWidget {
  final String imageName;
  const CartProductImage({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CachedNetworkImage(
        imageUrl: '${AppLinks.imageItems}/$imageName',
        width: 72,
      ),
    );
  }
}
