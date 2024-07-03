import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop_provider/provider/product_provider.dart';

import '../config/app_colors.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_item.dart';
import 'add_product_screen.dart';
import 'cart_screen.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Afghan Mall',style: TextStyle(color: blue,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),));
          }, icon: const Icon(Iconsax.shopping_cart,))
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            },icon: const Icon(Iconsax.menu_1),);
          }
        ),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(children: [

          // all products text
          const Gap(24),
          const Align(alignment: Alignment.centerLeft, child: Text('All Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),


          // all products
          const Gap(24),
          Expanded(
            child: Consumer<Product>(
              builder: (context, product, child){
              return product.list.isNotEmpty? GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1/1.5,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12
                    ),
                    itemBuilder:(context, i) {
                      return ProductItem(product: product.list[i],);
                    },
                    itemCount: product.list.length,

                  ) : Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Iconsax.bag_cross_1,size: 80,color: Colors.black54,),
                      const Gap(24),
                      const Text('No Product, Start Adding Some',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      CupertinoButton(child: const Text('+ Add Product',style: TextStyle(color: orange),), onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen(),));
                      })
                    ],
                  ),);
              }
            )
          )


        ],),
      ),
    );
  }
}
