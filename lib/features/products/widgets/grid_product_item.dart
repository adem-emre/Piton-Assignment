import 'package:flutter/material.dart';
import 'package:piton_assignment/core/const/color_const.dart';
import 'package:piton_assignment/features/products/views/product_detail/product_detail_view.dart';

import 'favourite_button.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductDetailView()));
      },
      splashColor: Colors.purple,
      child: Card(
        color: ColorConst.gridProductItemColor,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 7,
                    child: Image.network(
                      "https://cdn-ss.akinon.net/products/2021/01/26/143326/fff4112f-12a8-47b3-8e1b-721467ab46f2.jpg",
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
                            "Lorem ips " * 5,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "125 TL",
                              style: TextStyle(color: Colors.green),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
            const FavouriteButton(),
          ],
        ),
      ),
    );
  }
}
