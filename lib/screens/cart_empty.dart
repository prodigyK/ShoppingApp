import 'package:course_firebase_app/constants/color_consts.dart';
import 'package:course_firebase_app/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Image.asset('assets/images/empty_cart.png'),
        Text('Your Cart Is Empty', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 36)),
        Text(
          "You didn't add any item \n to you cart yet!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: darkTheme ? Theme.of(context).disabledColor : ColorsConsts.subTitle,
          ),
          textAlign: TextAlign.center,
        ),
        Container(
          width: size.width * 0.9,
          height: size.height * 0.06,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorsConsts.favBadgeColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ),
                ),
              ),
            ),
            child: Text(
              'SHOP NOW',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Theme.of(context).buttonColor,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
