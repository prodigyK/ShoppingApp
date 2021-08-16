import 'package:course_firebase_app/constants/color_consts.dart';
import 'package:flutter/material.dart';

class BrandNavigationRailItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      height: 200,
      child: Row(
        children: [
          Container(
            width: 150,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU')),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
          Container(
            width: 130,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title'),
                  SizedBox(height: 10),
                  FittedBox(
                      child: Text(
                    'US 16 \$',
                    style: TextStyle(color: ColorsConsts.favColor, fontSize: 30),
                  )),
                  SizedBox(height: 20),
                  Text('Category'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
