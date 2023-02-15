import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class ViewerController extends GetxController {
//__________selectedPdf________________
  RxInt selectedPdf = 0.obs;
  setSelectedPdf(int newindex) {
    selectedPdf(newindex);
  }

  getSelectedPdf() {
    return selectedPdf.value;
  }

  //__________listPdf______________
}
