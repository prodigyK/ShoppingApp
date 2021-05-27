import 'package:course_firebase_app/screens/cart_empty.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CartEmpty(size: size),
    );
  }
}
