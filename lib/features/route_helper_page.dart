import 'package:alarm_app/features/home_screen.dart';
import 'package:alarm_app/features/onboarding_screen/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteHelper extends StatelessWidget {
  static const routeName = '/route_helper';

  const RouteHelper({super.key});
  Future<bool> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeen = prefs.getBool('seenOnboarding') ?? false;
    return hasSeen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data == true) {
            return HomeScreen();
          } else {
            return const OnboardingScreen();
          }
        },
      ),
    );
  }
}
