
import 'product.dart';
import'cart.dart';
import'cartProduct.dart';
import'CartPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void addItemToCart(Product product) {
    Provider.of<Cart>(context, listen: false).addItemToCart(product);
  }

  void navigateToCartPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => cartpage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Image.asset(
                "assets/logo.png",
                width: 200,
              ),
              elevation: 8.0,
              actions: [
                IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    navigateToCartPage(context);
                  },
                ),
              ],

            ),
            body: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    'assets/001.png',
                    'assets/002.jpg',
                    'assets/003.png',
                  ].map((String assetPath) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset(
                          assetPath,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 300),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                      return Container(
                        // width: 400,
                        // height: 400,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                width: 200.0,
                                height: 200.0,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  products[index].image,
                                ),
                              ),
                              Text(
                                products[index].name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'serif',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${products[index].price}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 40.0),
                                    child: Icon(Icons.favorite_border_outlined, size: 24),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_shopping_cart),
                                    onPressed: () => addItemToCart(products[index]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
         ));
    }
}