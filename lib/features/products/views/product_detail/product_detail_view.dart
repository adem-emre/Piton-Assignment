import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piton_assignment/core/const/service_const.dart';
import 'package:piton_assignment/core/const/string_const.dart';
import 'package:piton_assignment/core/style/style.dart';
import 'package:piton_assignment/features/products/service/product_service.dart';
import 'package:piton_assignment/features/products/views/product_detail/product_detail_notifier.dart';
import 'package:provider/provider.dart';

import '../../enum/load_state.dart';
import '../../widgets/favourite_button.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key, required this.productId})
      : super(key: key);
  final int productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.productDetail),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ProductDetailNotifier()
          ..getProductDetailById(productId),
        child: Builder(builder: (context) {
          return Consumer<ProductDetailNotifier>(
            builder: (context, productDetailNotfier, _) {
              if (productDetailNotfier.loadState == LoadState.error) {
                return Center(
                  child:
                      Text(StringConst.errMsg + productDetailNotfier.errorMsg),
                );
              } else if (productDetailNotfier.loadState == LoadState.loaded) {
                return Column(
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
                                  offset: const Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ]),
                              child: Image.network(
                                ServiceConst.imageBaseUrl +
                                    (productDetailNotfier
                                            .productDetail!.image ??
                                        ""),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            FavouriteButton(
                              productId:
                                  productDetailNotfier.productDetail?.id ?? 0,
                              likeList:
                                  productDetailNotfier.productDetail?.likes,
                              onTap: () async {
                                bool success = await productDetailNotfier
                                    .likeOrUnlike(productId);
                                if (!success) {
                                  Fluttertoast.showToast(
                                      msg: StringConst.errMsg);
                                }
                              },
                            ),
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
                              const SizedBox(
                                height: itemBetweenPadding,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "${productDetailNotfier.productDetail!.price ?? ""} TL",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: itemBetweenPadding,
                              ),
                              Text(
                                productDetailNotfier.productDetail?.name ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text(
                                productDetailNotfier
                                        .productDetail?.description ??
                                    "",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              const Spacer(),
                              const _CartButton()
                            ],
                          ),
                        ))
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }),
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
