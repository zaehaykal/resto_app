import 'dart:async';
import 'package:resto_app/data/model/restaurant_ressource.dart';
import 'package:flutter/material.dart';
import 'package:resto_app/data/api/api_service.dart';

enum ResultState { loading, noData, hasData, error }

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  DetailRestaurantProvider({required this.apiService, required this.id}) {
    _fetchDetailRestaurant(id);
  }

  late DetailRestaurant _detailRestaurant;
  late ResultState _state;
  String _message = '';
  String get message => _message;
  DetailRestaurant get result => _detailRestaurant;
  ResultState get state => _state;

  Future<dynamic> _fetchDetailRestaurant(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final detailRestaurant = await apiService.detailRestaurant(id);
      if (detailRestaurant.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailRestaurant = detailRestaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Please Check your connection or try again later.';
    }
  }
}
