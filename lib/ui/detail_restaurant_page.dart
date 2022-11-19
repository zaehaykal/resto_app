import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app/data/api/api_service.dart';
import 'package:resto_app/provider/detail_restaurant_provider.dart';
import 'package:resto_app/common/style.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final String id;
  const RestaurantDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController controllerScroll = ScrollController();
    return ChangeNotifierProvider<DetailRestaurantProvider>(
        create: (_) =>
            DetailRestaurantProvider(apiService: ApiService(), id: id),
        child: Scaffold(
          backgroundColor: colorBackGround,
          appBar: AppBar(
            backgroundColor: ColorSelect().appBarColor,
            title: const Text('Detail Restaurant Recomended'),
          ),
          body: SafeArea(
            child: Consumer<DetailRestaurantProvider>(
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
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: ColorSelect().color1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Hero(
                                  tag: state.result.restaurant.pictureId,
                                  child: Image.network(
                                    'https://restaurant-api.dicoding.dev/images/large/${state.result.restaurant.pictureId}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.result.restaurant.name,
                                style: Theme.of(context).textTheme.headline4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                ),
                                Text(
                                  state.result.restaurant.city,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow),
                                Text(state.result.restaurant.rating.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline5)
                              ],
                            ),
                            const Divider(color: Colors.black),
                            Text('Description',
                                style: Theme.of(context).textTheme.headline6),
                            const SizedBox(height: 15),
                            Text(
                              state.result.restaurant.description,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            const Divider(color: Colors.black),
                            Text(
                              'Foods',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 170,
                              child: ListView(
                                controller: controllerScroll,
                                padding: const EdgeInsets.all(8),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Row(
                                      children: state
                                          .result.restaurant.menus.foods
                                          .map((foods) => Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        height: 150,
                                                        width: 150,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorSelect()
                                                              .color1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            const Icon(
                                                                Icons
                                                                    .local_dining,
                                                                size: 50),
                                                            Text(
                                                              foods.name,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                          .toList())
                                ],
                              ),
                            ),
                            Text(
                              'Drinks',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 170,
                              child: ListView(
                                controller: controllerScroll,
                                padding: const EdgeInsets.all(8),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Row(
                                      children: state
                                          .result.restaurant.menus.drinks
                                          .map((foods) => Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        height: 150,
                                                        width: 150,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorSelect()
                                                              .color1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            const Icon(
                                                                Icons
                                                                    .local_drink_sharp,
                                                                size: 50),
                                                            Text(
                                                              foods.name,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                          .toList())
                                ],
                              ),
                            ),
                            const Divider(color: Colors.black),
                            Text('Review',
                                style: Theme.of(context).textTheme.headline6),
                            const SizedBox(height: 15),
                            SizedBox(
                              height: 500,
                              child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: state
                                            .result.restaurant.customerReviews
                                            .map((customerReviews) => Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 15),
                                                    SizedBox(
                                                      child: Container(
                                                        height: 150,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorSelect()
                                                              .color1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: <Widget>[
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  const Icon(
                                                                      Icons
                                                                          .account_circle,
                                                                      size: 30),
                                                                  const SizedBox(
                                                                    height: 12,
                                                                  ),
                                                                  Text(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 4,
                                                                    '${customerReviews.name} :',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .subtitle1,
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                customerReviews
                                                                    .review,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText1,
                                                              ),
                                                              Text(
                                                                customerReviews
                                                                    .date,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText1,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                            .toList())
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state.state == ResultState.noData ||
                  state.state == ResultState.error) {
                Text(state.message);
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(Icons.signal_wifi_bad, size: 100),
                      const SizedBox(height: 10),
                      Text(state.message),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Back'))
                    ],
                  ),
                );
              } else {
                return const Center(child: Text(''));
              }
            }),
          ),
        ));
  }
}
