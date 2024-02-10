import 'package:flutter/material.dart';
import 'package:vegetables_app/view/components/textstyle.dart';

import '../../utils/data.dart';
import '../../utils/images.dart';
import '../../utils/routes_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> CartData = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu_open_outlined,
          color: Colors.white,
          size: 28,
        ),
        title: const Text(
          "Organic Vegetables",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            // decoration:
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/blur.h"),
                opacity: 0.8,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.05,
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: double.infinity,
                            color: Colors.white24,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          gapPadding: 2,
                        ),
                        //search
                        hintText: "Search your choice of Vegetables...",
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 15,
                    ),
                    child: Row(
                      children: [
                        ...Images.map(
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(MyRoutes.CartPage);
                            },
                            child: Container(
                              height: h * 0.27,
                              width: w * 0.8,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff0C3B2E),
                                  width: 1,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(e),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ).toList(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...AllVegetables.map(
                            (ele) => Container(
                              height: h * 0.2,
                              width: double.infinity,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                // border: Border.all(color: Color(0xff0C3B2E),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Image.network(
                                        ele["photo_url"].toString(),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      height: h * 2,
                                      color: Color(0xff6D9773),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Name : ${ele["name"]}",
                                            style: Mystyle(),
                                          ),
                                          Text(
                                            "Quantity : ${ele["quantity"]}",
                                            style: Mystyle(),
                                          ),
                                          Text(
                                            "Price : ${ele["price"]}",
                                            style: Mystyle(),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushNamed(MyRoutes.CartPage,arguments: CartData[]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              height: h * 0.04,
                                              width: w * 0.3,
                                              decoration: BoxDecoration(
                                                color: Color(0xff0C3B2E),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Text(
                                                "   Add To Cart",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ),
          ),
        ],
      ),
    );
  }
}
/*Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/blur.jpg"),
            opacity: 0.8,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: h * 0.05,
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: double.infinity,
                        color: Colors.white24,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 2,
                    ),
                    //search
                    hintText: "Search your choice of Vegetables...",
                    hintStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    ...Images.map(
                      (e) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(MyRoutes.CartPage);
                        },
                        child: Container(
                          height: h * 0.27,
                          width: w * 0.8,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff0C3B2E),
                              width: 1,
                            ),
                            image: DecorationImage(
                              image: AssetImage(e),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ).toList(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...AllVegetables.map(
                        (ele) => Container(
                          height: h * 0.2,
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            // border: Border.all(color: Color(0xff0C3B2E),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Image.network(
                                    ele["photo_url"].toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  height: h * 2,
                                  color: Color(0xff6D9773),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Name : ${ele["name"]}",
                                        style: Mystyle(),
                                      ),
                                      Text(
                                        "Quantity : ${ele["quantity"]}",
                                        style: Mystyle(),
                                      ),
                                      Text(
                                        "Price : ${ele["price"]}",
                                        style: Mystyle(),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed(MyRoutes.CartPage);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          height: h * 0.04,
                                          width: w * 0.3,
                                          decoration: BoxDecoration(
                                            color: Color(0xff0C3B2E),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            "   Add To Cart",
                                            style: TextStyle(
                                              color: Colors.white,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
*/
