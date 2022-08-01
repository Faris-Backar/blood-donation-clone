import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:blood_donation/screens/accepted_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/colors.dart';
import 'common/hive_boxes.dart';
import 'common/styles.dart';
import 'screens/add_blood_request_screen.dart';
import 'screens/add_news_item.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/news_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tutorial_screen.dart';
import 'screens/who_can_donate_screen.dart';

Future<void> main() async {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  await Hive.initFlutter();
  await Hive.openBox(ConfigBox.key);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation',
      theme: ThemeData(
        primarySwatch: MainColors.swatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: Fonts.text,
      ),
      initialRoute: SplashScreen.route,
      routes: {
        HomeScreen.route: (_) => const HomeScreen(),
        TutorialScreen.route: (_) => const TutorialScreen(),
        LoginScreen.route: (_) => const LoginScreen(),
        RegistrationScreen.route: (_) => const RegistrationScreen(),
        SplashScreen.route: (_) => const SplashScreen(),
        ProfileScreen.route: (_) => const ProfileScreen(),
        WhoCanDonateScreen.route: (_) => const WhoCanDonateScreen(),
        AddBloodRequestScreen.route: (_) => const AddBloodRequestScreen(),
        NewsScreen.route: (_) => const NewsScreen(),
        AddNewsItem.route: (_) => const AddNewsItem(),
        EditProfileScreen.route: (_) => const EditProfileScreen(),
        AcceptedRequestScreen.route: (_) => const AcceptedRequestScreen(),
      },
    );
  }
}
