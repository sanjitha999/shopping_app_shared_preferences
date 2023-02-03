import 'package:flutter/material.dart';
import '../widgets/product.dart';

class ProductCard extends StatelessWidget {
  final Product prod;

  ProductCard(this.prod);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(5),
      child: GridTile(
        child: Image.network(prod.imageUrl),
        header: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              prod.title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        footer: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              'PRICE: ${prod.price.toString()}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
