import 'package:alarm_app/common_widgets/custom_button.dart';
import 'package:alarm_app/constants/colors.dart';
import 'package:alarm_app/controllers/location_controller.dart';
import 'package:alarm_app/features/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:location/location.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/location_screen';

  LocationScreen({super.key});
  final LocationController locationController = Get.put(LocationController());
  String? _address;

  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome! Your\nPersonalized Alarm',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 10),

              Text(
                'Allow us to sync your sunset alarm\nbased on your location.',

                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // SizedBox(height: 10),
              Center(
                child: Container(
                  color: Colors.red,
                  height: 260,
                  width: 260,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),

                    child: Image.asset(
                      'assets/imgs/morning2-transformed-1.png',
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              Text(
                _address == null ? 'hello' : _address!,
                style: TextStyle(color: Colors.white),
              ),
              CustomButton(
                onTap: () async {
                  await locationController.getCurrentLocation().then(
                    (value) => Get.toNamed(HomeScreen.routeName),
                  );
                },
                bgColor: Color(0xFF4c4c4c),
                textColor: Colors.white,
                title: 'Use Current Location',
                imgs: 'assets/imgs/location-05.png',
              ),
              SizedBox(height: 10),

              CustomButton(
                onTap: () {
                  Get.toNamed(HomeScreen.routeName);
                },
                bgColor: Color(0xFF4c4c4c),
                textColor: Colors.white,
                title: 'Home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
