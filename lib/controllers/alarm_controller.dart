import 'package:alarm_app/model/alarm_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AlarmController extends GetxController {
  var alarms = <Alarm>[].obs;

  void addAlarm(TimeOfDay time, DateTime date) {
    alarms.add(Alarm(time: time, date: date));
  }
}
