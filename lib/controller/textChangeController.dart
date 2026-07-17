

// ==========================================
// 1. THE CONTROLLER (Logic & Data)
// ==========================================
import 'package:get/get.dart';


class HelloWorldController extends GetxController {
  // .obs makes this variable "observable" (reactive)
  RxString message = "Hello World!".obs;

  void changeText() {
    if (message.value == "Hello World!") {
      message.value = "Text Changed!";
    } else {
      message.value = "Hello World!";
    }
  }
}





