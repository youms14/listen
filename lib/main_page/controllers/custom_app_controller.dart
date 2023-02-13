import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class CustomAppController extends GetxController {
  var leading = "main".obs;

  setLeading(String newleading) {
    leading(newleading);
  }
}
