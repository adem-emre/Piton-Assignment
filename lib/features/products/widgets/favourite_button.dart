import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 9,
        right: 9,
        child: InkWell(
          onTap: (){},
          child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ], color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.favorite)),
        ));
  }
}
