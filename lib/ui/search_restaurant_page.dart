import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app/common/style.dart';
import 'package:resto_app/provider/search_restaurant_provider.dart';
import 'package:resto_app/widget/card_restaurant.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search_page';
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String cariQuery = '';
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackGround,
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: ColorSelect().appBarColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          pageSearch(),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<SearchProvider>(builder: (context, state, _) {
              if (state.state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.state == ResultState.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.result!.restaurants.length,
                    itemBuilder: (context, index) {
                      var restaurant = state.result!.restaurants[index];
                      return CardRestaurant(restaurant: restaurant);
                    });
              } else if (state.state == ResultState.noData) {
                return Center(
                    child: Column(
                  children: const [
                    Icon(Icons.priority_high, size: 50),
                    SizedBox(height: 24),
                    Text('Sorry we could not find any results!')
                  ],
                ));
              } else if (state.state == ResultState.noConnection) {
                return Center(
                  child: Column(
                    children: [
                      Text(state.message),
                    ],
                  ),
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
                return const Center(child: Text(''));
              }
            }),
          )
        ],
      )),
    );
  }

  Widget pageSearch() {
    return Consumer<SearchProvider>(builder: (context, state, _) {
      return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: 'Search Restaurant',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              maxLines: 1,
              controller: _search,
              onChanged: (String query) {
                if (query.isNotEmpty) {
                  setState(() {
                    cariQuery = query;
                  });
                  state.fetchSearchRestaurant(query);
                }
              },
            ),
          ),
        ],
      );
    });
  }
}
