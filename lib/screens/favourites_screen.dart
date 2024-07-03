import 'package:flutter/material.dart';
import 'package:online_shop_provider/provider/product_provider.dart';

import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourites'),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Consumer<Product>(
          builder: (context, product, child) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1/1.5,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12
                ),
                itemBuilder:(context, i) {
                  return ProductItem(product: product.favouriteList[i],);
                },
                itemCount: product.favouriteList.length,
              ),
        )
      ),),
    );
  }
}
