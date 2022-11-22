// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:foodhub_malabon/src/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  const ProductsGrid({super.key, required this.showFavorites});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showFavorites ? productsData.favoriteItems : productsData.items;
    return Scaffold(
      //GridView layout will be used to show the products
      body: GridView.builder(
        //10 pixels of padding in all edges
        padding: const EdgeInsets.all(10.0),
        //Set the number of items that will be loaded dynamically, get the length of loadedProucts list
        itemCount: products.length,
        //itemBuilder defines how every grid/cell item  is built
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(
              // id: products[index].id,
              // title: products[index].title,
              // imageURL: products[index].imageURL,
              ),
        ),
        //gridDelegate allows to define how the grid will be structured, how many columns will it have
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //crossAxisCount will set how many columns you want
          crossAxisCount: 2,
          //childAspectRatio will set the aspect ratio of the grid item, itemWidht / itemHeight
          childAspectRatio: 3 / 2,
          //crossAxisSpacing will set the spacing between the columns
          crossAxisSpacing: 10,
          //mainAxisSpacing will set the spacing between the rows
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
