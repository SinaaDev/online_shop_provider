import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop_provider/provider/cart_provider.dart';
import 'package:online_shop_provider/provider/product_provider.dart';
import '../config/app_colors.dart';
import '../config/custom_snackbar.dart';
import '../model/product_model.dart';
import 'package:provider/provider.dart';

class DescriptionScreen extends StatelessWidget {
  final ProductModel product;
  const DescriptionScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details'),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          // image
          AspectRatio(
              aspectRatio: 1/0.5,
              child: Image.file(File(product.image),fit: BoxFit.contain,)),

          // price
            const Gap(24),
          Text('${product.price} AFN',style: const TextStyle(color: orange,fontWeight: FontWeight.bold,fontSize: 24),),

          // description
            const Gap(12),
          Text(product.description),
        ],),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: (){
            deleteProduct(context);
          },child: const Icon(Iconsax.trash,color: Colors.white,),backgroundColor: Colors.red,),
          FloatingActionButton(onPressed: (){
            Provider.of<Cart>(context).addToCart(product);
                CustomSnackBar(context: context, message: 'Added to the Cart',backgroundColor: Colors.black54).show();
              },child: const Icon(Iconsax.shopping_cart),backgroundColor: Colors.white,),

        ],
      ),
    );
  }

  void deleteProduct(BuildContext context){
    Provider.of<Product>(context).deleteProduct(product);
    Navigator.pop(context);
    CustomSnackBar(context: context, message: 'Product Deleted',backgroundColor: Colors.red,).show();
  }

}
