import 'package:flutter/material.dart';
import 'package:piton_assignment/core/const/color_const.dart';
import 'package:piton_assignment/core/const/service_const.dart';
import 'package:piton_assignment/features/products/model/product_model.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({Key? key, required this.product, required this.onTap})
      : super(key: key);
  final Product product;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.purple,
      child: Card(
        color: ColorConst.gridProductItemColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 7,
                child: Image.network(
                  ServiceConst.imageBaseUrl + (product.image ?? ""),
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        product.name ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "${product.price ?? ""} TL",
                          style: const TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
