import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop_provider/provider/cart_provider.dart';

import '../config/app_colors.dart';
import '../config/custom_snackbar.dart';
import '../model/product_model.dart';
import '../screens/description_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
final ProductModel product;
  const ProductItem({super.key, required this.product,});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(product: widget.product),));
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.file(File(widget.product.image),fit: BoxFit.cover,height: 120,
              )),
              const Gap(12),
              const Spacer(),
              Text(widget.product.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              const Gap(4),
              Text('${widget.product.price} AFN',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: orange),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      widget.product.favorite = !widget.product.favorite;
                    });
                  }, icon:widget.product.favorite? const Icon(Iconsax.heart5,color: orange,):const Icon(Iconsax.heart)),
                  const Text('Review'),
                  Consumer<Cart>(
                    builder: (context, cart, child) => IconButton(onPressed: (){
                            cart.addToCart(widget.product);
                            CustomSnackBar(context: context, message: 'Added to the Cart',backgroundColor: Colors.black54).show();
                          }, icon: const Icon(Iconsax.shopping_cart)),
                  )
                ],)
            ],
          ),
        ),
      ),
    );
  }
}
