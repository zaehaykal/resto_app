import 'package:resto_app/data/database/database.dart';
import 'package:resto_app/provider/favorite_restaurant_provider.dart';
import 'package:resto_app/provider/list_restaurant_provider.dart';
import 'package:resto_app/provider/search_restaurant_provider.dart';
import 'package:resto_app/ui/detail_restaurant_page.dart';
import 'package:resto_app/ui/favorite_page.dart';
import 'package:resto_app/ui/home_restaurant_page.dart';
import 'package:resto_app/ui/list_restaurant_page.dart';
import 'package:resto_app/ui/search_restaurant_page.dart';
import "common/style.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/api/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ListRestaurantProvider>(
          create: (_) => ListRestaurantProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (_) => SearchProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Recommended',
          theme: ThemeData(
            textTheme: fontsTheme,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: primaryColor,
                  onPrimary: Colors.black,
                  secondary: secondaryColor,
                ),
          ),
          initialRoute: RestaurantHomePage.routeName,
          routes: {
            RestaurantHomePage.routeName: (context) =>
                const RestaurantHomePage(),
            SearchPage.routeName: (context) => const SearchPage(),
            RestaurantFavoritePage.routeName: (context) =>
                const RestaurantFavoritePage(),
            RestaurantListPage.routeName: (context) =>
                const RestaurantListPage(),
            RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
                  id: ModalRoute.of(context)?.settings.arguments as String,
                ),
          }),
    );
  }
}
