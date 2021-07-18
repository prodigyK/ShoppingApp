import 'package:course_firebase_app/constants/color_consts.dart';
import 'package:course_firebase_app/constants/icon_consts.dart';
import 'package:course_firebase_app/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  double top = 0.0;
  double topMargin = 300;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                elevation: 4,
                automaticallyImplyLeading: false,
                expandedHeight: topMargin,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (ctx, constraints) {
                    top = constraints.biggest.height;
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              opacity: top <= 110 ? 1.0 : 0,
                              duration: Duration(milliseconds: 300),
                              child: Row(
                                children: [
                                  SizedBox(width: 12),
                                  Container(
                                    height: kToolbarHeight / 1.8,
                                    width: kToolbarHeight / 1.8,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 1.0,
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text('Some title'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        background: Image(
                          image: NetworkImage(
                              'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userTitle('User Information'),
                    Divider(thickness: 1, color: Colors.grey),
                    userListTile('Email', 'Email sub', AppIcons.mail, context),
                    userListTile('Phone Number', '4555', AppIcons.phone, context),
                    userListTile('Shipping Address', '', AppIcons.mapPin, context),
                    userListTile('Joined Date', 'date', AppIcons.calendar, context),
                    userTitle('User Settings'),
                    Divider(thickness: 1, color: Colors.grey),
                    ListTileSwitch(
                      value: themeChange.darkTheme,
                      leading: Icon(AppIcons.moon),
                      onChanged: (value) {
                        setState(() {
                          themeChange.darkTheme = value;
                        });
                      },
                      visualDensity: VisualDensity.comfortable,
                      switchType: SwitchType.cupertino,
                      switchActiveColor: Theme.of(context).accentColor,
                      title: Text('Dark Theme'),
                    ),
                    userListTile('Log out', '', AppIcons.logOut, context),
                  ],
                ),
              ),
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = topMargin - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = topMargin - 100.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    // print('ScrollController = $_scrollController');

    if (_scrollController!.hasClients) {
      // print('ScrollController.hasClients = $_scrollController');
      double offset = _scrollController!.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }

  Widget userTitle(String title) => Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 8, top: 20),
        child: Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      );

  Widget userListTile(String title, String subtitle, IconData icon, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        onTap: () {},
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(icon),
          // onTap: (){},
        ),
      ),
    );
  }
}
