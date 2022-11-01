import 'package:flutter/material.dart';
import 'package:resto_app/ui/list_restaurant_page.dart';
import 'package:resto_app/ui/search_restaurant_page.dart';
import 'package:resto_app/common/style.dart';

class RestaurantHomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const RestaurantHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackGround,
      appBar: AppBar(
        backgroundColor: ColorSelect().appBarColor,
        title: const Text('Restaurant Recommended'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (() {
              Navigator.pushNamed(context, SearchPage.routeName);
            }),
          )
        ],
      ),
      body: const RestaurantListPage(),
    );
  }
}
