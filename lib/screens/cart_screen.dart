import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app_shared_preferences/data/product_data.dart';

import '../widgets/product.dart';


class CartScreen extends StatefulWidget {
  static const routeName = '/cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<Product> _cartProducts = [];
  Future<List<String>> getCartDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('cart') ?? [];
  }

  void initState() {
    super.initState();
    getCartDetails().then((productIds) {
      for(String id in productIds){
        Product prod = productList.firstWhere((element) => element.id==id);
        _cartProducts.add(prod);
      }
      print(_cartProducts.length);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      // body: _cartProducts==null? Text("Your cart is empty, start adding to your cart"): Text('cart items'),
      body: Column(
        children: [
          Text("Cart Items", style: TextStyle(fontSize: 25),),
          Expanded(child: _cartProducts==null || _cartProducts.isEmpty
              ? Center(child: Text("Your cart is empty, start adding to your cart"))
              : ListView.builder(
            itemCount: _cartProducts.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(_cartProducts[index].title),
                  leading: Image.network(_cartProducts[index].imageUrl),
                  trailing: Text('${_cartProducts[index].price} Rs'),
                ),
              );
            },
          ),)


        ],
      )


    );
  }
}
