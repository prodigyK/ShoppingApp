import 'package:course_firebase_app/constants/color_consts.dart';
import 'package:course_firebase_app/screens/cart_empty.dart';
import 'package:course_firebase_app/screens/cart_item.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var products = [];

    return products.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart Items'),
              centerTitle: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CartItem(),
                        CartItem(),
                        CartItem(),
                        CartItem(),
                        CartItem(),
                        CartItem(),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                  child: Column(
                    children: [
                      Divider(
                        height: 6,
                        thickness: 1,
                        color: Theme.of(context).disabledColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * 0.5,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  ColorsConsts.gradiendLStart,
                                  ColorsConsts.gradiendLEnd,
                                ],
                                stops: [0.0, 0.7],
                              ),
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                  color: ColorsConsts.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                Text(
                                  'Total:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  width: size.width * 0.25,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      '\$450.00',
                                      style: TextStyle(
                                        color: ColorsConsts.purple300,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
