import 'package:flutter/material.dart';
import 'package:vegetables_app/utils/data.dart';

import '../components/textstyle.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int Count = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    Map<String, dynamic> Data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...cartData
                  .map(
                    (e) => Container(
                      height: h * 0.2,
                      width: double.infinity,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Color(0xff0C3B2E),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(4, 3),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Image.network(
                                e["photo_url"].toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff6D9773),
                              ),
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 10,
                              ),
                              height: h * 2,
                              child: Column(
                                children: [
                                  Text(
                                    "Name : ${e["name"]}",
                                    style: Mystyle(),
                                  ),
                                  Text(
                                    "Quantity : ${e["quantity"]}",
                                    style: Mystyle(),
                                  ),
                                  Text(
                                    "Price : ${e["price"]}",
                                    style: Mystyle(),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              (Count != 1)
                                                  ? Count--
                                                  : cartData.remove(e);
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                      ),
                                      Container(
                                        height: h * 0.03,
                                        width: w * 0.1,
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Text("${[Count.toString()]}"),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              Count++;
                                            },
                                          );
                                        },
                                        icon: const Icon(
                                            Icons.add_circle_outline),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
