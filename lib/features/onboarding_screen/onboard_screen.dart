import 'package:alarm_app/constants/colors.dart';
import 'package:alarm_app/features/onboarding_screen/onboarding_slider.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const routeName = '/onboarding-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.bgColor,
      backgroundColor: AppColor.bgColor,
      body: Column(children: [Expanded(child: OnboardingSlider())]),
    );
  }
}
