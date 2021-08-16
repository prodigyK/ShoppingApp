import 'package:course_firebase_app/constants/icon_consts.dart';
import 'package:course_firebase_app/screens/cart.dart';
import 'package:course_firebase_app/screens/feeds.dart';
import 'package:course_firebase_app/screens/home.dart';
import 'package:course_firebase_app/screens/search.dart';
import 'package:course_firebase_app/screens/user_info.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Widget>> _pages = [];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': Home(),
      },
      {
        'page': Feeds(),
      },
      {
        'page': Search(),
      },
      {
        'page': Cart(),
      },
      {
        'page': UserInfo(),
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.05,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ))),
          child: BottomNavigationBar(
            onTap: _selectPage,
            elevation: 0,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).backgroundColor,
            unselectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(AppIcons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(AppIcons.rss), label: 'Feeds'),
              BottomNavigationBarItem(activeIcon: null, icon: Icon(null), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(AppIcons.cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(AppIcons.user), label: 'User'),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 4,
          child: Icon(AppIcons.search),
          onPressed: () => setState(() {
            _selectedPageIndex = 2;
          }),
        ),
      ),
    );
  }
}
