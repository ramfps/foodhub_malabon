// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodhub_malabon/src/providers/cart_provider.dart';
import 'package:foodhub_malabon/src/providers/orders.dart';
import 'package:foodhub_malabon/src/screens/cart_screen.dart';
import 'package:foodhub_malabon/src/screens/orders_screen.dart';
import 'package:foodhub_malabon/src/screens/product_detail_screen.dart';
import 'package:foodhub_malabon/src/screens/products_overview_screen.dart';
import 'src/screens/products_overview_screen.dart';
import 'src/constants/constants.dart';
import 'src/providers/products_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
        },
      ),
    );
  }
}
