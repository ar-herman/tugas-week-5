import 'package:get/get.dart';
import 'package:tugas/controller/apicontroller.dart';
import 'package:tugas/controller/maincontroller.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Maincontroller());
    Get.lazyPut(() => Apicontroller());
  }
}
