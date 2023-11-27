import 'package:flutter/material.dart';
import 'home.dart';
import 'appearance.dart';
import 'checkout.dart';
import'cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create:(context)=>Cart(),
           builder:(context,child)=>MaterialApp(
              debugShowCheckedModeBanner: false,
              title:'Victorias',
              home:App(),
          ),
    );

  }
}
