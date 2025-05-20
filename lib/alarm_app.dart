import 'package:alarm_app/binding/controller_binding.dart';
import 'package:alarm_app/features/home_screen.dart';
import 'package:alarm_app/features/location_screen.dart';
import 'package:alarm_app/features/onboarding_screen/onboard_screen.dart';
import 'package:alarm_app/features/route_helper_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmApp extends StatelessWidget {
  const AlarmApp({super.key});

  Future<bool> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeen = prefs.getBool('seenOnboarding') ?? false;
    return hasSeen;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeScreen(),
      initialBinding: ControllerBinding(),
      initialRoute: RouteHelper.routeName,

      routes: {
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        RouteHelper.routeName: (_) => const RouteHelper(),
        LocationScreen.routeName: (_) => LocationScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
    );
  }
}
