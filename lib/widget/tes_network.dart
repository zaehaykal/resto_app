import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app/provider/list_restaurant_provider.dart';

Widget refreshButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      context.read<ListRestaurantProvider>().fetchAllRestaurant();
    },
    icon: const Icon(Icons.refresh),
  );
}
