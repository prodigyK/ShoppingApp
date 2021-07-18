import 'package:course_firebase_app/constants/color_consts.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Card(
        elevation: 3,
        color: ColorsConsts.bgCartItem,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://www.ixbt.com/img/n1/news/2020/10/3/new-apple-watch-form-factor-coming-next-year-531609-2_large.jpg'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monitor 2',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.cancel_outlined),
                          color: Colors.red,
                          onPressed: () {},
                        )
                      ],
                    ),
                    Text('Price: \$450.00'),
                    Row(
                      children: [
                        Text('Sub Total: '),
                        Text('\$450.00', style: TextStyle(color: Theme.of(context).primaryColor)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Ships Free',
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: _changeAmountButton(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _changeAmountButton(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Container(
            width: 40,
            height: 31,
            child: Icon(Icons.remove, color: Colors.red),
          ),
          splashColor: Colors.red.shade200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          onTap: () {},
        ),
        Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            // color: Theme.of(context).primaryColor,
            gradient: LinearGradient(
              colors: [
                ColorsConsts.gradiendLStart,
                ColorsConsts.gradiendLEnd,
              ],
              stops: [0.0, 0.7],
            ),
          ),
          child: Center(
            child: Text(
              '12',
              style: TextStyle(
                color: Theme.of(context).buttonColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
        InkWell(
          child: Container(
            width: 40,
            height: 31,
            child: Icon(Icons.add, color: Colors.green),
          ),
          splashColor: Colors.green.shade200,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
