import 'package:flutter/material.dart';

class PriceBox extends StatelessWidget {
  const PriceBox({
    Key? key,
    required this.price,
  }) : super(key: key);
  final double price;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 15,
        right: 15,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          constraints: const BoxConstraints(
            minWidth: 75,
            minHeight: 30,
          ),
          decoration: ShapeDecoration(shadows: [
            BoxShadow(
              color: Colors.white.withOpacity(0.30),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ], color: Colors.black, shape: const StadiumBorder()),
          child: Center(
            child: Text(
              "$price TL",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
