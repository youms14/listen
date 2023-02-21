import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class CustomAppController extends GetxController {
  var leading = "main".obs;
  Logger logger = Logger();
  setLeading(String newleading) {
    leading(newleading);
  }

  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    final dirS = await getApplicationSupportDirectory();
    final dirD = await getExternalStorageDirectory();
    final ldir = await getExternalStorageDirectories();

    logger.e(dir.path);
    logger.e(dirS.path);
    logger.e(dirD?.path);
    logger.e(ldir);
    return dir.path;
  }
}
