import 'package:course_firebase_app/constants/icon_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 250,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage('https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                right: 12,
                top: 10,
                child: IconButton(
                  icon: Icon(Entypo.star, color: Colors.grey.shade800),
                  // iconSize: 30,
                  onPressed: () {},
                ),
              ),
              Positioned(
                right: 10,
                top: 7,
                child: IconButton(
                  icon: Icon(Entypo.star_outlined, color: Colors.white),
                  // iconSize: 30,
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 120,
                right: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 40,
                  color: Colors.white,
                  child: Text(
                    '\$ 99.9',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 250,
            height: 100,
            padding: EdgeInsets.only(left: 8, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text('Couch', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                Row(
                  children: [
                    Text('Couch', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                    Spacer(),
                    IconButton(
                      icon: Icon(AppIcons.cart),
                      onPressed: () {},
                    )
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
