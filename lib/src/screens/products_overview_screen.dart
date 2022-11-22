// ignore_for_file: sort_child_properties_last, prefer_const_constructors, deprecated_member_use

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:foodhub_malabon/src/constants/constants.dart';
import 'package:foodhub_malabon/src/screens/cart_screen.dart';
import 'package:foodhub_malabon/src/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../widgets/app_draw.dart';
import '../providers/cart_provider.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorite = true;
                } else {
                  _showOnlyFavorite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
            ],
          ),
          Consumer<Cart>(
            builder: (context, cartData, ch) => Badge(
                child: ch!,
                value: cartData.itemCount.toString(),
                color: Theme.of(context).accentColor),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(
        showFavorites: _showOnlyFavorite,
      ),
    );
  }
}
