import 'package:ant_icons/ant_icons.dart';
import 'package:winestore_flutter_web/widgets/shop.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winestore_flutter_web/sideNavBar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'homePage.dart';

class TopBar extends StatelessWidget {
  final Color iconColor;
  const TopBar(this.iconColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _popupMenu() {
      return PopupMenuButton<int>(
        color: Colors.white,
        padding: EdgeInsets.all(0.0),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Container(
              width: 130,
              height: 50.0,
              child: Row(
                children: [
                  Icon(
                    AntIcons.user,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 05.0, top: 0.5),
                    child: Text("My Profile"),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Container(
              width: 130,
              height: 50.0,
              child: Row(
                children: [
                  Icon(
                    AntIcons.heart_outline,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 05.0, top: 0.0),
                    child: Text("Favorite"),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: Container(
              width: 130,
              height: 50.0,
              child: Row(
                children: [
                  Icon(
                    AntIcons.shopping_cart,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 05.0, top: 0.0),
                    child: Text("Cart"),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: 4,
            child: Container(
              width: 130,
              height: 50.0,
              child: Row(
                children: [
                  Icon(
                    AntIcons.login,
                    color: Colors.black,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 05.0, top: 0.0),
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ],
        child: Padding(
          padding: EdgeInsets.only(top: 01.0),
          child: Icon(
            Icons.more_vert_outlined,
            color: iconColor,
            size: 28.0,
          ),
        ),
      );
    }

    var currentWidth = MediaQuery.of(context).size.width;
    var extraLargeScreenGrid = currentWidth > 1536;
    var largeScreenGrid = currentWidth > 1366;
    var smallScreenGrid = currentWidth > 1201;
    var extraSmallScreenGrid = currentWidth > 1025;
    var tabScreenGrid = currentWidth > 769;
    var mobileScreenGrid = currentWidth > 481;

    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      //color: Colors.indigo[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(right: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                extraSmallScreenGrid
                    ? Container()
                    : Container(
                        padding: EdgeInsets.only(right: 20.0),
                        child: InkWell(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              expand: false,
                              enableDrag: false,
                              isDismissible: false,
                              barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              duration: Duration(seconds: 0),
                              context: context,
                              builder: (context) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 280.0,
                                      child: SideNavBar(),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Icon(AntIcons.menu, color: iconColor),
                        ),
                      ),
                smallScreenGrid ? iconColor == Colors.black ? Image.asset("assets/logo-black.png", width: 100, height: 100,fit: BoxFit.fill,)
                    : Image.asset("assets/logo-white.png",  width: 100, height: 100, fit: BoxFit.fill,)
    /*Row(
                  children: [
                    Icon(
                      AntIcons.radar_chart,
                      size: 45.0,
                      color: Colors.indigo[600],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 05.0, top: 08.0),
                      child: Text(
                        companyName,
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.indigo[600],
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )*/ : Container(),
                extraLargeScreenGrid
                    ? Container(
                        height: 40.0,
                        margin: EdgeInsets.only(left: 180.0),
                        width: largeScreenGrid
                            ? 500.0
                            : smallScreenGrid
                                ? 500.0
                                : 400.0,
                        child: TextField(
                          cursorColor: Colors.indigo[600],
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding:
                                    EdgeInsets.only(right: 10.0, bottom: 02.0),
                                child: Icon(
                                  FeatherIcons.search,
                                  color: Colors.indigo[600],
                                  size: 22.0,
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFFEEEEEE),
                              contentPadding:
                                  EdgeInsets.only(left: 25.0, top: 30.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontSize: 15.0),
                              hintText: 'Search here...'),
                          style:
                              TextStyle(fontSize: 16.0, color: iconColor),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          extraSmallScreenGrid
              ? Row(
                  children: [
                    Container(
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(0.0),
                          ),
                          padding: EdgeInsets.all(18.0),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0,
                              top: 05.0,
                              right: 20.0,
                              bottom: 05.0),
                          child: Text(
                            'Home',
                            style: TextStyle(color: iconColor),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(0.0),
                          ),
                          padding: EdgeInsets.all(18.0),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 20.0),
                              child: Text(
                                'About us',
                                style: TextStyle(color: iconColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(0.0),
                          ),
                          padding: EdgeInsets.all(18.0),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Shop()));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Text(
                                'Our wines',
                                style: TextStyle(color: iconColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(0.0),
                          ),
                          padding: EdgeInsets.all(18.0),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Text(
                                'Blog',
                                style: TextStyle(color: iconColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    Container(
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(0.0),
                          ),
                          padding: EdgeInsets.all(18.0),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Text(
                                'Contact',
                                style: TextStyle(color: iconColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
          Row(
            children: [
              extraLargeScreenGrid
                  ? Container()
                  : Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Tooltip(
                        message: 'Search',
                        child: Container(
                          padding: EdgeInsets.all(05.0),
                          child: Icon(
                            FeatherIcons.search,
                            size: 25.0,
                            color: iconColor,
                          ),
                        ),
                      ),
                    ),
              tabScreenGrid
                  ? Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Tooltip(
                        message: 'Cart',
                        child: Container(
                          padding: EdgeInsets.all(05.0),
                          child: Stack(
                            children: <Widget>[
                              Icon(
                                CupertinoIcons.cart,
                                size: 26.0,
                                color: iconColor,
                              ),
                              Positioned(
                                right: 4.0,
                                top: 1.0,
                                child: Stack(
                                  children: <Widget>[
                                    Icon(
                                      Icons.brightness_1,
                                      size: 08.0,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              _popupMenu(),
            ],
          ),
        ],
      ),
    );
  }
}
