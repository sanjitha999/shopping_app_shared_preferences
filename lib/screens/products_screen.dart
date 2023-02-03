import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = '/products_screen';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              print("cart clicked");
              Navigator.pushNamed(context, '/cart-screen');

            },
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            label: Text('Cart'),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/product-details-screen',
                    arguments: productList[index].id);
              },
              child: ProductCard(productList[index]));
        },
        itemCount: productList.length,
      ),
    );
  }
}
