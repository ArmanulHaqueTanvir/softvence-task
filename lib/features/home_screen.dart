import 'package:alarm_app/common_widgets/custom_button.dart';
import 'package:alarm_app/constants/colors.dart';
import 'package:alarm_app/controllers/alarm_controller.dart';
import 'package:alarm_app/controllers/location_controller.dart';
import 'package:alarm_app/helpers/notification_services.dart';
import 'package:alarm_app/model/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  HomeScreen({super.key});

  final AlarmController alarmController = Get.put<AlarmController>(
    AlarmController(),
    permanent: true,
  );
  final LocationController locationController = Get.put<LocationController>(
    LocationController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    bool light = true;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.bgColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Container(
                width: screenSize.width - 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Location',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.location_on, size: 40, color: Colors.white),
                        SizedBox(height: 10),

                        Obx(
                          () => Container(
                            width: screenSize.width - 150,
                            child: Text(
                              locationController.location.value,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),

                    CustomButton(
                      onTap: () {
                        _showAddAlarmDialog(context);
                      },
                      bgColor: AppColor.kSecoundaryColor,
                      textColor: Colors.white,
                      title: 'Add Alarm',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alarms',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Container(
                    height: 430,
                    width: double.infinity,
                    child: Expanded(
                      child: Obx(() {
                        return ListView.builder(
                          itemCount: alarmController.alarms.length,
                          itemBuilder: (context, index) {
                            Alarm alarm = alarmController.alarms[index];
                            return Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(
                                vertical: 24,
                                horizontal: 16,
                              ),
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColor.kSecoundaryColor,

                                borderRadius: BorderRadius.circular(8),
                              ),

                              child: Row(
                                children: [
                                  Text(
                                    alarm.time.format(context),
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    // alarm.date.toLocal().toString().split(
                                    //   ' ',
                                    // )[0],
                                    DateFormat(
                                      'EEE d MMM yyyy',
                                    ).format(alarm.date),
                                    // alarm.date.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Switch(
                                    activeColor: Colors.white,
                                    activeTrackColor: AppColor.kPrimarColor,
                                    inactiveTrackColor:
                                        AppColor.kSecoundaryColor,
                                    value: true,
                                    onChanged: (value) {
                                      light = value;
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddAlarmDialog(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(2101),
      );

      if (pickedDate != null) {
        alarmController.addAlarm(pickedTime, pickedDate);
        NotificationService.showNotification(
          id: 1,
          title: 'Alarm Set Successfully',
          body:
              'Your alarm has been scheduled at ${pickedTime.format(context)} ${DateFormat('EEE d MMM yyyy').format(pickedDate)}.',
        );
      }
    }
  }
}
