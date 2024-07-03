import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop_provider/provider/cart_provider.dart';

import '../model/product_model.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
   const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'),),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(children: [
          const Gap(24),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const Spacer(),
              Consumer<Cart>(
                  builder: (context, cart, child) => Text('${cart.totalPrice} AFN',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              const Gap(12),
              SizedBox(
                  width: 100,
                  height: 40,
                  child: Consumer<Cart>(
                      builder: (context, cart, child) => CupertinoButton(child: const Text('Order'), onPressed:cart.clearCart ,color: Colors.black54,padding: EdgeInsets.zero,)),
                    )
            ],),
          ),
          const Gap(24),
          Expanded(
            child: Consumer<Cart>(
              builder: (context, cart, child) {
                return cart.list.isNotEmpty? ListView.builder(
                  itemBuilder:(context, i) {
                    return CartItem(product: cart.list[i]);
                  },
                  itemCount: cart.list.length,

                ) : const Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.bag_cross_1,size: 80,color: Colors.black54,),
                    Gap(24),
                    Text('No Item in the Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ],
                ),);
              },
            )
          ),
        ],),
      ),),
    );
  }
}
