
import 'cart.dart';
import 'cartProduct.dart';
import 'checkout.dart';
import 'product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cartpage extends StatefulWidget {
  const cartpage({Key? key}) : super(key: key);

  @override
  State<cartpage> createState() => _cartpageState();
}
class _cartpageState extends State<cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          "assets/logo.png",
          width: 200,
        ),
        elevation: 8.0,
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.getUsersCart().length,
                  itemBuilder: (context, index) {
                    Product item = cart.getUsersCart()[index];
                    double totalPrice = item.price * item.quantity;
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
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 65.0,
                                  height: 65.0,
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0, left: 8.0),
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'serif',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.0, left: 8.0),
                                  child: Text(
                                    'Price: ${item.price}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (item.quantity > 0) {
                                          item.quantity--;
                                        }
                                      });
                                    },
                                    iconSize: 20, // Adjust the size of the remove icon
                                  ),
                                  Text(
                                    ' ${item.quantity}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        if (item.quantity < 10) {
                                          item.quantity++;
                                        }
                                      });
                                    },
                                    iconSize: 20, // Adjust the size of the add icon
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.0, left: 10.0),
                              child: Text(
                                'Total: \$${totalPrice}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                              icon: Icon(Icons.remove_shopping_cart),
                              color: Colors.black,
                              onPressed: () {
                                cart.removeItem(item);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Final Price: \$${cart.calculateFinalPrice()}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              TextButton(
                onPressed: cart.getUsersCart().isEmpty || cart.calculateFinalPrice() == 0
                    ? null
                    : () {
                  double finalPrice = cart.calculateFinalPrice();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkout(finalPrice: finalPrice),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: Size(400.0, 0),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
