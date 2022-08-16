import 'package:flutter/material.dart';
import 'package:piton_assignment/core/auth/auth_manager.dart';
import 'package:piton_assignment/features/products/model/product_model.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton(
      {Key? key, required this.productId, required this.likeList})
      : super(key: key);
  final int productId;
  final List<Likes>? likeList;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 9,
        right: 9,
        child: InkWell(
          onTap: () {},
          child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ], color: Colors.white, shape: BoxShape.circle),
              child: _isLiked()
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border)),
        ));
  }

  bool _isLiked() {
    if (likeList != null && likeList!.isNotEmpty) {
      return likeList!.any((element) => element.token == AuthManager.token);
    }
    return false;
  }
}
