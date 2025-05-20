import 'package:alarm_app/alarm_app.dart';
import 'package:alarm_app/helpers/notification_services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  runApp(const AlarmApp());
}
