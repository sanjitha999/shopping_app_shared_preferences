import 'package:flutter/material.dart';
import './screens/products_screen.dart';
import './screens/product_details_screen.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: ProductsScreen.routeName,
      routes: {
        ProductsScreen.routeName: (ctx) => ProductsScreen(),
        ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
      },
    );
  }
}