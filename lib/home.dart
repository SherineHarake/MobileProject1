
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
            width: MediaQuery.of(context).size.width > 600 ? 200 : 150,
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
                height: MediaQuery.of(context).size.width > 600 ? 200.0 : 150.0,
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
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 2,
                  mainAxisExtent: 300,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
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
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width > 600 ? 40 : 20,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width > 600 ? 200.0 : 150.0,
                            alignment: Alignment.center,
                            child: Image.asset(
                              products[index].image,
                            ),
                          ),
                          Text(
                            products[index].name,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width > 600 ? 18 : 14,
                              fontFamily: 'serif',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${products[index].price}',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width > 600 ? 15 : 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 600 ? 40.0 : 20.0),
                                child: Icon(Icons.favorite_border_outlined, size: MediaQuery.of(context).size.width > 600 ? 24 : 20),
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
      ),
    );
  }
}