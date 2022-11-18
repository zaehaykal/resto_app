import 'package:flutter/material.dart';
import 'package:resto_app/common/style.dart';
import 'package:resto_app/data/model/restaurant_ressource.dart';
import 'package:resto_app/ui/detail_restaurant_page.dart';
import 'package:resto_app/widget/favorite.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  const CardRestaurant({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Card(
          color: ColorSelect().color1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Hero(
              tag: restaurant.pictureId,
              child: Image.network(
                'https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}',
                width: 100,
              ),
            ),
            title: Text(restaurant.name,
                style: Theme.of(context).textTheme.headline6),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(restaurant.rating.toString(),
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    Text(restaurant.city,
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ],
            ),
            onTap: () => Navigator.pushNamed(
              context,
              RestaurantDetailPage.routeName,
              arguments: restaurant.id,
            ),
          ),
        ),
        FavoriteButton(restaurant: restaurant),
      ],
    );
  }
}
