import 'package:alarm_app/common_widgets/custom_button.dart';
import 'package:alarm_app/constants/colors.dart';
import 'package:alarm_app/features/location_screen.dart';
import 'package:alarm_app/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingSlider extends StatefulWidget {
  const OnboardingSlider({super.key});

  @override
  State<OnboardingSlider> createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider>
    with SingleTickerProviderStateMixin {
  PageController? _controller;
  int nextPage = 0;

  @override
  void initState() {
    _controller = PageController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller!,
                  itemCount: onboardingData.length,
                  itemBuilder: (_, i) {
                    final onboardingM = onboardingData[i];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          onboardingM.image,
                          fit: BoxFit.fill,
                          width: screenSize.width,
                          height: screenSize.height * 0.55,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                onboardingM.title,
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.076,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                onboardingM.subTitle,
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.036,

                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              SmoothPageIndicator(
                controller: _controller!,
                count: onboardingData.length,

                effect: ScrollingDotsEffect(
                  dotColor: Colors.grey,
                  dotWidth: 8,
                  dotHeight: 8,
                  spacing: 12,
                  activeDotColor: AppColor.kPrimarColor,
                ),
              ),
              const SizedBox(height: 24),

              // Next button
              CustomButton(
                title: "Next",
                onTap: () {
                  if (_controller!.page == onboardingData.length - 1) {
                    // Go to Location screen

                    Get.toNamed(LocationScreen.routeName);
                  } else {
                    _controller!.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                bgColor: AppColor.kPrimarColor,
                textColor: Colors.white,
              ),
              const SizedBox(height: 36),
            ],
          ),

          // Skip button at the top right
          Positioned(
            top: 45,
            right: 35,
            child: GestureDetector(
              onTap: () {
                // Skip to home
                // Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
