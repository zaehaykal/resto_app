import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:resto_app/provider/list_restaurant_provider.dart';
import 'package:resto_app/widget/card_restaurant.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/list_restauran';
  final String? bangsat = 'asnji';
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListRestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Please Wait', style: TextStyle(fontSize: 30)),
              SizedBox(height: 10),
              CircularProgressIndicator(
                color: Colors.blue,
              ),
            ],
          ));
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restraunt = state.result.restaurants[index];
              return CardRestaurant(restaurant: restraunt);
            },
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Text(state.message),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.signal_wifi_bad, size: 100),
                const SizedBox(height: 10),
                Text(state.message),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text(''),
          );
        }
      },
    );
  }
}
