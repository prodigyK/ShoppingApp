import 'dart:math';

import 'package:badges/badges.dart';
import 'package:course_firebase_app/constants/icon_consts.dart';
import 'package:course_firebase_app/constants/temp_data.dart';
import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int index = Random().nextInt(TempData.images.length);

    return Container(
      width: 250,
      height: 510,
      child: Card(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight: size.height * 0.3,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(TempData.images[index]),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Beautiful watches for a good price',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: 10),
                      Text('\$ 179.99', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                      Row(
                        children: [
                          Text('Quantity:', style: TextStyle(fontSize: 12, color: Theme.of(context).disabledColor)),
                          SizedBox(width: 5),
                          Text('12 left', style: TextStyle(fontSize: 12, color: Theme.of(context).disabledColor)),
                          Spacer(),
                          IconButton(
                            icon: Icon(AppIcons.more_horizontal),
                            color: Theme.of(context).disabledColor,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Badge(
              toAnimate: true,
              shape: BadgeShape.square,
              badgeColor: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(8),
              badgeContent: Text('New', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
