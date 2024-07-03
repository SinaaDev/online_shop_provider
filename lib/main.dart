import 'package:flutter/material.dart';
import 'package:online_shop_provider/provider/cart_provider.dart';
import 'package:online_shop_provider/provider/product_provider.dart';
import 'package:online_shop_provider/screens/all_products_screen.dart';

import 'config/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Product(),),
        ChangeNotifierProvider(create: (context) => Cart(),),
      ],
      child: MaterialApp(
          theme: AppTheme().themeData,
          debugShowCheckedModeBanner: false,
          home: const AllProductsScreen(),
      ),
    );
  }
}

