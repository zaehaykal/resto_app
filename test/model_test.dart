import 'package:flutter_test/flutter_test.dart';
import 'package:resto_app/data/model/restaurant_ressource.dart';

void main() {
  group('Restaurant', () {
    test('Restaurant.toJson', () async {
      final restaurant = Restaurant(
        id: 'id',
        name: 'name',
        description: 'description',
        pictureId: 'pictureId',
        city: 'city',
        rating: 5,
      );
      expect(restaurant.toJson(), {
        "id": "id",
        "name": "name",
        "description": "description",
        "pictureId": "pictureId",
        "city": "city",
        "rating": 5.0,
      });
    });
    test('Restaurant.fromJson', () async {
      Map<String, dynamic> restaurantJson = {
        "id": "id",
        "name": "name",
        "description": "description",
        "pictureId": "pictureId",
        "city": "city",
        "rating": 5.0,
      };

      expect(Restaurant.fromJson(restaurantJson), isA<Restaurant>());
    });
  });
}
