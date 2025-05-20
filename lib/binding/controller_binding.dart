import 'package:alarm_app/controllers/alarm_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AlarmController>(AlarmController(), permanent: true);
  }
}
