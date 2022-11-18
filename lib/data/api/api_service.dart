import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resto_app/data/model/restaurant_ressource.dart';

class ApiService {
  static const String baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String imageUrl =
      'https://restaurant-api.dicoding.dev/images/medium/{pictureId}';

  Future<ListRestaurantResults> listRestaurant(http.Client client) async {
    final response = await http.get(Uri.parse("${baseUrl}list"));
    if (response.statusCode == 200) {
      return ListRestaurantResults.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list data restaurant');
    }
  }

  Future<DetailRestaurant> detailRestaurant(String id) async {
    final response = await http.get(Uri.parse("${baseUrl}detail/$id"));
    if (response.statusCode == 200) {
      return DetailRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail data restaurant');
    }
  }

  Future<Search> searchRestaurant(String query) async {
    final kunciQuery = query.replaceAll(' ', '%20');
    final response =
        await http.get(Uri.parse("${Url.baseUrl}search?q=$kunciQuery"));
    if (response.statusCode == 200) {
      return Search.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail data restaurant');
    }
  }
}
