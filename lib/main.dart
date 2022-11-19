import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:resto_app/data/database/database.dart';
import 'package:resto_app/provider/favorite_restaurant_provider.dart';
import 'package:resto_app/provider/list_restaurant_provider.dart';
import 'package:resto_app/provider/preferences.dart';
import 'package:resto_app/provider/scheduling_provider.dart';
import 'package:resto_app/provider/search_restaurant_provider.dart';
import 'package:resto_app/ui/detail_restaurant_page.dart';
import 'package:resto_app/ui/favorite_page.dart';
import 'package:resto_app/ui/home_restaurant_page.dart';
import 'package:resto_app/ui/list_restaurant_page.dart';
import 'package:resto_app/ui/search_restaurant_page.dart';
import 'package:resto_app/utils/background_notifikasi_service.dart';
import 'package:resto_app/utils/notification_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "common/style.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/api/api_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();

  service.initializeIsolate();
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
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
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
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
