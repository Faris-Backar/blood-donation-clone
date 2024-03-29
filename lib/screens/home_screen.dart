import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:blood_donation/screens/accepted_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/assets.dart';
import '../common/colors.dart';
import '../widgets/all_blood_requests.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Blood Requests'), actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AcceptedRequestScreen.route);
          },
          icon: Icon(Icons.notification_important),
        ),
      ]),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          IconAssets.bloodBagHand,
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Donate Blood,\nSave Lives',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: MainColors.primary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverAppBar(
              title: Text(
                'Current Requests',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: MainColors.primary),
              ),
              primary: false,
              pinned: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              automaticallyImplyLeading: false,
            ),
            const AllBloodRequests(),
          ],
        ),
      ),
    );
  }
}
