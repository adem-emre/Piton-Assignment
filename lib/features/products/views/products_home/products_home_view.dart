import 'package:flutter/material.dart';
import 'package:piton_assignment/core/const/string_const.dart';
import 'package:piton_assignment/core/style/style.dart';
import 'package:piton_assignment/features/products/enum/load_state.dart';
import 'package:piton_assignment/features/products/service/product_service.dart';
import 'package:piton_assignment/features/products/views/products_home/products_home_notifier.dart';
import 'package:piton_assignment/features/products/widgets/grid_product_item.dart';
import 'package:provider/provider.dart';

class ProductsHomeView extends StatelessWidget {
  const ProductsHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ProductsHomeNotifier(ProductService())..getAllProducts(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(StringConst.products),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: horizontalPagePadding),
            child: Consumer<ProductsHomeNotifier>(
              builder: ((context, productsNotifier, _) {
                if (productsNotifier.loadState == LoadState.error) {
                  return Center(
                    child: Text(productsNotifier.errorMsg),
                  );
                } else if (productsNotifier.loadState == LoadState.loaded) {
                  return GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 285,
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 6,
                              crossAxisCount: 2),
                      itemCount: productsNotifier.products.length,
                      itemBuilder: (context, index) {
                        return GridProductItem(
                          product: productsNotifier.products[index],
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ),
        );
      }),
    );
  }
}
