// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/screens/cart_screen/cart.dart';
import 'package:resturant_app/screens/cart_screen/cart_controller.dart';
import 'package:resturant_app/screens/menus/full_menu.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants.dart';

class browse extends StatefulWidget {
  const browse({Key? key}) : super(key: key);
  static String routeName = "/browse";

  @override
  State<browse> createState() => _browseState();
}

class _browseState extends State<browse> {
  int indicator = 0;
  // int categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Timer.periodic(Duration(seconds: 5), (Timer t) {
    //   setState(() {
    //     if (indicator == imgList.length) {
    //       indicator = 0;
    //     } else {
    //       indicator = indicator + 1;
    //     }
    //   });
    // });
    return SafeArea(
      child: Scaffold(
        drawer: buildDrawer(),
        appBar: AppBar(
          title: const Text("Menu"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                final cartController = Get.put(CartController());
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          ],
        ),
        body: buildBody(context),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 60,
            child: DrawerHeader(
              child: Text("    Ali Ahmed",
                  style: TextStyle(fontSize: 20, color: Colors.red[700])),
            ),
          ),
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              "My Orders",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              "Support",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          SizedBox(height: 10),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildOfferCards(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Categories",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    buildCategories(),
                    const SizedBox(height: 5),
                    buildViewMenuButton(context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOfferCards() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 170, // card height
            child: PageView.builder(
              itemCount: imgList.length,
              controller: PageController(viewportFraction: 0.95),
              onPageChanged: (int index) => setState(() => indicator = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == indicator ? 1 : 1,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      imgList[i],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedSmoothIndicator(
            activeIndex: indicator,
            count: imgList.length,
            effect: const WormEffect(),
          ),
        ],
      ),
    );
  }

  Widget buildCategories() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisExtent: 150,
        mainAxisSpacing: 4,
      ),
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            AspectRatio(
              aspectRatio: 3 / 2,
              child: GestureDetector(
                child: Image.asset(categoryList[index].image),
                onTap: () {
                  // print("this is ${categoryList[index].title}");
                },
              ),
            ),
            Text(categoryList[index].title),
          ],
        );
      },
    );
  }

  GestureDetector buildViewMenuButton(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 50,
        width: 700,
        child: Card(
          color: Colors.red[700],
          elevation: 5 / 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Text(
              "View Our Menu",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const FoodMenu()));
      },
    );
  }
}
