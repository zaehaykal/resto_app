import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app/common/style.dart';
import 'package:resto_app/provider/favorite_restaurant_provider.dart';
import 'package:resto_app/widget/card_restaurant.dart';

class RestaurantFavoritePage extends StatelessWidget {
  static const routeName = '/favorite_page';

  const RestaurantFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controllerScroll = ScrollController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBackGround,
        appBar: AppBar(
          backgroundColor: ColorSelect().appBarColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Your Favorite Restaurant',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Consumer<DatabaseProvider>(
                builder: (context, value, _) {
                  if (value.state == ResultState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (value.state == ResultState.hasData) {
                    return ListView.builder(
                      controller: controllerScroll,
                      shrinkWrap: true,
                      itemCount: value.favorites.length,
                      itemBuilder: (context, index) {
                        var restaurant = value.favorites[index];
                        return CardRestaurant(restaurant: restaurant);
                      },
                    );
                  } else if (value.state == ResultState.noData) {
                    return Center(
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.no_meals_ouline,
                              color: Color.fromARGB(255, 144, 148, 153),
                              size: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('No Favorite!'),
                          ],
                        ),
                      ),
                    );
                  } else if (value.state == ResultState.error) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.signal_wifi_bad, size: 100),
                          SizedBox(height: 10),
                          Text(
                              'Please Check your connection or try again later'),
                        ],
                      ),
                    );
                  } else {
                    return const Text(' ');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
