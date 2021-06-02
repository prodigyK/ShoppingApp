import 'package:course_firebase_app/constants/color_consts.dart';
import 'package:course_firebase_app/constants/temp_data.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
    @required this.size,
    @required this.darkMode,
    @required this.index,
  }) : super(key: key);

  final Size size;
  final bool darkMode;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: size.width * 0.35,
            height: size.width * 0.28,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(TempData.brands[index], fit: BoxFit.fill),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            width: size.width * 0.35,
            height: size.width * 0.08,
            color: Colors.grey.shade100,
            child: Text(
              TempData.categories[index],
              style: TextStyle(
                color: darkMode ? ColorsConsts.title : Theme.of(context).textSelectionTheme.selectionColor,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
