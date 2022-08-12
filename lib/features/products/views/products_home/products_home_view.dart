import 'package:flutter/material.dart';
import 'package:piton_assignment/core/const/string_const.dart';
import 'package:piton_assignment/core/style/style.dart';
import 'package:piton_assignment/features/products/widgets/grid_product_item.dart';

class ProductsHomeView extends StatelessWidget {
  const ProductsHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.products),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPagePadding),
        child: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 285,
                crossAxisSpacing: 3,
                mainAxisSpacing: 6,
                crossAxisCount: 2),
            itemCount: 18,
            itemBuilder: (context, index) {
              return const GridProductItem();
            }),
      ),
    );
  }
}
