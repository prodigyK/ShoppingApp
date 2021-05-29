import 'package:course_firebase_app/widgets/feed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feeds',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            color: Colors.red,
            icon: Icon(Ionicons.ios_heart),
            onPressed: () {},
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Ionicons.ios_cart),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: EdgeInsets.all(7.0),
        children: List.generate(
          20,
          (i) => FeedItem(),
        ),
        crossAxisCount: 2,
        childAspectRatio: 250 / 510,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
    );
  }
}
