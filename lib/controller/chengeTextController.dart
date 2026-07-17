import 'package:get/get.dart';

class ChangeMyTextController extends GetxController {
  // var msg = 'Hello Wolrd!'.obs;
  RxString msg = 'Hello Wolrd!'.obs;
  RxInt number = 1.obs;

  void changevalue() {
    if (msg.value == 'Hello Wolrd!') {
      msg.value = "I love Dart and Flutter";
    } else {
      msg.value = 'Hello Wolrd!';
    }
  }

  void upgrade() {
    if (number >= 10) {
    } else {
      number++;
    }
  }

  void substract() {
    if (number < 1) {
    } else {
      number--;
    }
  }
}
