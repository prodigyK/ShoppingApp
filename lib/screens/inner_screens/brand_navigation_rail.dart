import 'package:course_firebase_app/screens/inner_screens/brand_navigation_rail_widget.dart';
import 'package:flutter/material.dart';
import 'package:course_firebase_app/constants/temp_data.dart';

class BrandNavigationRailScreen extends StatefulWidget {
  const BrandNavigationRailScreen({Key? key}) : super(key: key);

  static const String routeName = '/navigation-rail';

  @override
  _BrandNavigationRailScreenState createState() => _BrandNavigationRailScreenState();
}

class _BrandNavigationRailScreenState extends State<BrandNavigationRailScreen> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    var brandIndex = ModalRoute.of(context)?.settings.arguments as int;
    _selectedIndex = brandIndex;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            minWidth: 60,
            groupAlignment: 1.0,
            destinations: TempData.brandNames.map((brand) {
              return NavigationRailDestination(
                label: Container(
                  margin: EdgeInsets.all(2.0),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Container(
                      child: Text(brand),
                    ),
                  ),
                ),
                icon: SizedBox.shrink(),
                // padding: EdgeInsets.all(2.0),
              );
            }).toList(),
            selectedIndex: _selectedIndex,
            selectedLabelTextStyle: TextStyle(
              fontSize: 18,
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            labelType: NavigationRailLabelType.all,
            leading: SizedBox(height: 40),
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) =>
                    BrandNavigationRailItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
