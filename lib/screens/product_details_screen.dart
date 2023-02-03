import 'package:flutter/material.dart';
import '../widgets/product.dart';
import '../data/product_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details-screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // final _pref = PreferencedService();

  Future<void> addToCart(String productId) async {
    print('inside async addToCart');
    final prefs = await SharedPreferences.getInstance();
    List<String> cart = prefs.getStringList('cart') ?? [];
    cart.add(productId);
    prefs.setStringList('cart', cart);
  }

  @override
  Widget build(BuildContext context) {

    final prodId = ModalRoute.of(context)?.settings.arguments;
    final Product prod =
        productList.firstWhere((element) => element.id == prodId);
    return Scaffold(
      // Todo: I wish to display the product name here
      appBar: AppBar(title: Text('Product description')),
      // Todo: Product details are displayed here
      body: SingleChildScrollView(
        child: Card(
          elevation: 10,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(prod.imageUrl),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                prod.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Price: ${prod.price}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(
                      "Product Description: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "${prod.desc}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Add item to cart");
                  addToCart(prod.id);
                },
                child: Text("ADD TO CART"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
