import 'dart:math';
import 'package:backdrop/backdrop.dart';
import 'package:backdrop/scaffold.dart';
import 'package:badges/badges.dart';
import 'package:course_firebase_app/constants/color_consts.dart';
import 'package:course_firebase_app/constants/icon_consts.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text("Home"),
        leading: BackdropToggleButton(
          icon: AnimatedIcons.home_menu,
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsConsts.gradiendLStart,
                ColorsConsts.endColor,
              ],
              stops: [0.0, 0.9],
            ),
          ),
        ),
        actions: [
          GestureDetector(
            child: Stack(
              children: [
                Center(child: Text('Wishlist', style: TextStyle(fontWeight: FontWeight.w800))),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Badge(
                    toAnimate: false,
                    shape: BadgeShape.circle,
                    badgeColor: Colors.red,
                    badgeContent: Text('0', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            onTap: () {},
          ),
          SizedBox(width: 25),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                radius: 18,
                child: ClipOval(
                    child: Image.asset(
                  'assets/images/user.png',
                )),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
      backLayer: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsConsts.gradiendLStart,
              ColorsConsts.endColor,
            ],
            stops: [0.0, 0.9],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 100,
              top: -140,
              child: Opacity(
                opacity: 0.4,
                child: Container(
                  width: 300,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white70,
                      ],
                      stops: [0.0, 0.9],
                    ),
                  ),
                  transform: Matrix4.rotationZ(60 * pi / 180),
                ),
              ),
            ),
            Positioned(
              left: 210,
              top: -150,
              child: Opacity(
                opacity: 0.4,
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white70,
                      ],
                      stops: [0.0, 0.9],
                    ),
                  ),
                  transform: Matrix4.rotationZ(60 * pi / 180),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.grey.shade700),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/user3.png',
                    colorBlendMode: BlendMode.darken,
                    color: ColorsConsts.gradiendFEnd,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 30),
                _homeItemMenu('Feeds', icon: AppIcons.rss),
                SizedBox(height: 30),
                _homeItemMenu('Cart', icon: AppIcons.cart),
                SizedBox(height: 30),
                _homeItemMenu('Chat', badge: true),
                SizedBox(height: 30),
                _homeItemMenu('Upload a new product ', icon: Icons.upload_file),
                SizedBox(height: 30),
                _homeItemMenu('Settings', textOnly: true),
              ],
            ),
          ],
        ),
      ),
      subHeader: BackdropSubHeader(
        title: Text("Sub Header"),
      ),
      frontLayer: Center(
        child: Text("Front Layer"),
      ),
    );
  }

  Widget _homeItemMenu(String item, {IconData icon, bool badge = false, bool textOnly = false}) {
    return textOnly
        ? Text(item, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800))
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
              if (!badge) SizedBox(width: 15),
              if (!badge) Icon(icon == null ? null : icon),
              if (badge)
                Badge(
                  toAnimate: false,
                  shape: BadgeShape.circle,
                  badgeColor: Colors.white,
                  badgeContent: Text('145', style: TextStyle(color: Colors.black)),
                )
            ],
          );
  }
}
