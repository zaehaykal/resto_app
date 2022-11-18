import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/data/model/restaurant_ressource.dart';
import 'package:http/http.dart' as http;
import 'api_service.mock.dart';

@GenerateMocks([http.Client])
void main() {
  ApiService restaurantRepository = ApiService();
  group('Restaurant ApiService', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
          .thenAnswer((_) async => http.Response(
              '{"error":false,"message":"success","count":20,"restaurants":[]}',
              200));
      expect(await restaurantRepository.listRestaurant(client),
          isA<ListRestaurantResults>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
          .thenAnswer((_) async => http.Response(
              '{"error":true,"message":"gagal memuat data","count":0,"restaurants":[]}',
              200));
      expect(restaurantRepository.listRestaurant(client), throwsException);
    });
  });
}
