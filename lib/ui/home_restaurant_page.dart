import 'package:flutter/material.dart';
import 'package:resto_app/ui/favorite_page.dart';
import 'package:resto_app/ui/list_restaurant_page.dart';
import 'package:resto_app/ui/search_restaurant_page.dart';
import 'package:resto_app/common/style.dart';
import 'package:resto_app/widget/tes_network.dart';

class RestaurantHomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const RestaurantHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackGround,
      bottomNavigationBar: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.home),
              const VerticalDivider(color: Colors.black),
              IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RestaurantFavoritePage())),
                icon: const Icon(Icons.favorite),
              ),
              const VerticalDivider(color: Colors.black),
              const Icon(Icons.settings),
            ],
          )),
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
      body: const RestaurantListPage(),
    );
  }
}
