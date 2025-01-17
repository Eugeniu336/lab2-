import 'package:flutter/material.dart';
import 'wine_shop_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WineShopScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}