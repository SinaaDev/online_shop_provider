import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop_provider/provider/cart_provider.dart';

import '../model/product_model.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final ProductModel product;
  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 14),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: ListTile(
        leading: Image.file(File(product.image)),
        title: Text(product.name),
        subtitle: Text('${product.price} AFN'),
        trailing: CupertinoButton(child: const Icon(Iconsax.trash,color: Colors.red,),onPressed: (){
          Provider.of<Cart>(context,listen: false).deleteFromCart(product);
        },),
      ),
    );
  }
}
