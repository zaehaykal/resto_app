import 'dart:async';
import 'package:flutter/material.dart';
import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/data/model/restaurant_ressource.dart';

enum ResultState { loading, noData, hasData, error }

class ListRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  ListRestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late ListRestaurantResults _restaurantResults;
  late ResultState _state;
  String _message = '';
  String get message => _message;
  ListRestaurantResults get result => _restaurantResults;
  ResultState get state => _state;
  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurantResults = await apiService.listRestaurant();
      if (restaurantResults.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResults = restaurantResults;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Please Check your connection or try again later.';
    }
  }
}
