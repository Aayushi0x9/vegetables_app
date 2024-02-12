import 'package:flutter/material.dart';
import 'package:vegetables_app/utils/routes_utils.dart';
import 'package:vegetables_app/view/screen/cart_page.dart';
import 'package:vegetables_app/view/screen/home_page.dart';

void main() {
  runApp(const VegetablesApp());
}

class VegetablesApp extends StatelessWidget {
  const VegetablesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "HomePage",
      routes: {
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.CartPage: (context) => const CartPage(),
      },
    );
  }
}
