import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/data/model/restaurant_ressource.dart';

enum ResultState { loading, noData, hasData, error, noConnection }

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchProvider({required this.apiService}) {
    fetchSearchRestaurant(query);
  }

  Search? _restaurantResults;
  ResultState? _state;
  String _message = '';
  String _query = '';
  String get message => _message;
  String get query => _query;
  Search? get result => _restaurantResults;
  ResultState? get state => _state;

  Future<dynamic> fetchSearchRestaurant(String query) async {
    try {
      if (query.isNotEmpty) {
        _state = ResultState.loading;
        _query = query;
        notifyListeners();
        final restaurantResults = await apiService.searchRestaurant(query);
        if (restaurantResults.restaurants.isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          return _message = 'Empty Data';
        } else {
          _state = ResultState.hasData;
          notifyListeners();
          return _restaurantResults = restaurantResults;
        }
      }
    } on SocketException {
      _state = ResultState.noConnection;
      notifyListeners();
      return _message = 'Please Check your connection or try again later.';
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
