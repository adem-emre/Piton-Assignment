import 'package:flutter/material.dart';
import 'package:piton_assignment/core/const/string_const.dart';
import 'package:piton_assignment/core/extensions/size_extension.dart';
import 'package:piton_assignment/core/style/style.dart';

import '../../widgets/price_box.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.productDetail),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ]),
                    child: Image.network(
                      "https://cdn-ss.akinon.net/products/2021/01/26/143326/fff4112f-12a8-47b3-8e1b-721467ab46f2.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  const PriceBox()
                ],
              )),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _LikeCountButton(),
                    Text(
                      "Ayakkabı " * 5,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      "Lorem ipsum dolor asdsdasd asdasda asa " * 5,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const Spacer(),
                    const _CartButton()
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class _CartButton extends StatelessWidget {
  const _CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12)),
        icon: const Icon(Icons.add_shopping_cart_outlined),
        label: const Text("Add to Cart"),
        onPressed: () {},
      ),
    );
  }
}

class _LikeCountButton extends StatelessWidget {
  const _LikeCountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      width: double.maxFinite,
                      constraints: BoxConstraints(
                        maxHeight: context.setScaledHeight(0.42),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return const ListTile(
                            leading: CircleAvatar(
                              child: Text("A"),
                            ),
                            title: Text("Piton Store"),
                            subtitle: Text("piton@mail.com"),
                          );
                        },
                      ),
                    ),
                  );
                });
          },
          icon: const Icon(Icons.favorite),
          label: const Text("(34)")),
    );
  }
}
