import 'package:flutter/material.dart';

import '../model/product_detail_model.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton(
      {Key? key,
      required this.productId,
      required this.likeList,
      required this.onTap})
      : super(key: key);
  final int productId;
  final List<Likes>? likeList;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 12,
        right: 12,
        child: InkWell(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ], color: Colors.white, shape: BoxShape.circle),
              child: Icon(
                (likeList != null && likeList!.isNotEmpty)
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 30,
              )),
        ));
  }
}
