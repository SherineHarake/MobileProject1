import 'cart.dart';
import'home.dart';
import 'product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Product product;
  CartItem({super.key, required this.product});
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  void addtoCart() {
    Provider.of<Cart>(context,listen:false).addItemToCart(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(products[index].name),
          subtitle: Text(products[index].price.toString()),
          leading: Image.asset(
            products[index].image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (products[index].quantity > 0) {
                      products[index].quantity--;
                    }
                  });
                },
              ),
              Text(
                ' ${products[index].quantity}',
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    if (products[index].quantity < 10) {
                      products[index].quantity++;
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
