import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class SwitchBullComponentController extends GetxController {
  RxInt selectedComponent = 1.obs;

  setSelectedComponent(int newNumberComponent) {
    selectedComponent(newNumberComponent);
  }

  getSelectedComponenent() {
    return selectedComponent.value;
  }

  //____________Affichage en liste ou en icone_______
  RxBool isList = false.obs;

  setIsListTRUE() {
    isList(true);
  }

  setIsListFALSE() {
    isList(false);
  }

  bool getIsList() {
    return isList.value;
  }
}
