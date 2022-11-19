import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app/common/style.dart';
import 'package:resto_app/provider/preferences.dart';
import 'package:resto_app/provider/scheduling_provider.dart';
import 'package:resto_app/widget/platform.dart';

class SettingsPage extends StatelessWidget {
  static const String settingsTitle = 'settings_page';

  const SettingsPage({Key? key}) : super(key: key);

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect().appBarColor,
      appBar: AppBar(
        backgroundColor: ColorSelect().appBarColor,
        title: Text(
          'Setting',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          _buildSetting(context),
        ],
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Setting'),
      ),
      child: _buildSetting(context),
    );
  }


  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildSetting(BuildContext context) {
    return Consumer<PreferencesProvider>(builder: (context, provider, child) {
      return ListTile(
        title: const Text('Notification Recommended Restaurant'),
        subtitle: const Text(
          'Enable Notification',
        ),
        trailing: Consumer<SchedulingProvider>(
          builder: (context, scheduled, _) {
            return Switch.adaptive(
              value: provider.isDailyRestaurantActive,
              onChanged: (value) async {
                scheduled.scheduledRestaurant(value);
                provider.enableDailyRestaurant(value);
              },
            );
          },
        ),
      );
    });
  }
}
