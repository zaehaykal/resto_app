import 'dart:io';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resto_app/ui/detail_restaurant_page.dart';
import 'package:resto_app/ui/favorite_page.dart';
import 'package:resto_app/ui/list_restaurant_page.dart';
import 'package:resto_app/common/style.dart';
import 'package:resto_app/ui/search_restaurant_page.dart';
import 'package:resto_app/ui/setting_notification_page.dart';
import 'package:resto_app/utils/notification_helper.dart';
import 'package:resto_app/widget/platform.dart';
import 'package:resto_app/widget/tes_network.dart';

class RestaurantHomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const RestaurantHomePage({Key? key}) : super(key: key);
  @override
  State<RestaurantHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<RestaurantHomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    const RestaurantListPage(),
    const RestaurantFavoritePage(),
    const SettingsPage()
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
          Platform.isIOS ? CupertinoIcons.news : MdiIcons.silverwareForkKnife),
      label: 'Home'.toString(),
    ),
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.news : MdiIcons.heart),
        label: 'Favorites'.toString()),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: 'Setting'.toString(),
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackGround,
      appBar: AppBar(
        backgroundColor: ColorSelect().appBarColor,
        title: const Text('Restaurant Recommended'),
        actions: [
          Row(
            children: [
              refreshButton(context),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: (() {
                  Navigator.pushNamed(context, SearchPage.routeName);
                }),
              ),
            ],
          )
        ],
      ),
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorSelect().appBarColor,
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavBarItems,
        activeColor: secondaryColor,
      ),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(RestaurantDetailPage.routeName);
  }

  @override
  void dispose() {
    super.dispose();
    selectNotificationSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
