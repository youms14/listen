import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:listen/api/client.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class BulletinApiController extends GetxController {
  //late Dio apiClient;
  RxString matricule = ''.obs;
  Dio dio = Dio();
  late RxString annee = ''.obs;
  late RxString mois = ''.obs;
  late Rx<Directory> tempDirectory = Directory('').obs;
  late Rx<Directory> saveDirectory = Directory('').obs;
  late RxString fullPathTemp = ''.obs;
  late RxString fullPathSave = ''.obs;
  bool isDownloaded = false;
  RxList<File> file = RxList<File>.empty();
  RxList<File> listeDeFichiers = RxList<File>.empty();
  RxString _titreViewerPage = ''.obs;
  // BulletinApiController() {
  //   apiClient = Client() as Dio;
  // }
  var response;
  setMois(String m) {
    mois(m);
  }

  setAnnee(String a) {
    annee(a);
  }

  getMois() {
    return mois.obs;
  }

  getAnnee() {
    return annee.obs;
  }

  setTitreViewerPage(String title) {
    _titreViewerPage(title);
  }

  String get titreViewerPage => _titreViewerPage.value;
// Future<void> initPlatformState() async {
//     _setPath();
//     if (!mounted) return;
// }
// void _setPath() async {
//     Directory _path = await getApplicationDocumentsDirectory();
//     String _localPath = _path.path + Platform.pathSeparator + 'Download';
//     final savedDir = Directory(_localPath);
//     bool hasExisted = await savedDir.exists();
//     if (!hasExisted) {
//         savedDir.create();
//     }
//     path = _localPath;
// }

  Future<bool> downloadBull() async {
    try {
      var repertoire =
          await getExternalStorageDirectory(); //Note: Si la permission n'est pas accordée il peut avoir problème
      logger.e(
          repertoire); //ie: /storage/emulated/0/Android/data/com.example.listen/files
      String fullPath = "";
      //on vérirfie que le repertoire existe, sinon on le crée.
      bool hasExisted = await repertoire!.exists();
      if (hasExisted) {
        saveDirectory(repertoire);
        fullPath = "${repertoire.path}/Bulletin_$mois-$annee.pdf";
        fullPathSave(fullPath);
      } else {
        await repertoire.create();
        fullPath = "${repertoire.path}/Bulletin_$mois-$annee.pdf";
        saveDirectory(repertoire);
        fullPathSave(fullPath);
      }
      //on vérifie maintenant si le fichier existe deja a été téléchargé
      if (!File(fullPathSave.value).existsSync()) {
        //en supposant le le fichier est déjà présent dans l'objet RESPONSE, faire:
        print("DEBUT DE LA COPIE");

        File newFile = File(fullPathSave.value);
        var raf = newFile.openSync(mode: FileMode.write);
        // response.data is List<int> type
        raf.writeFromSync(response.data);
        await raf.close();
        file[0].delete();
        file.clear();
        file.add(newFile);
        print("FIN DE LA COPIE");
        return true;
      } else {
        logger.e("Fichier déjà téléchargé.");
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  getBull() async {
    try {
      var tempDir = await getTemporaryDirectory();

      String fullPath1 = "${tempDir.path}/Bulletin_$mois-$annee.pdf";
      //String fullPath2 ="/storage/emulated/0/Android/data/com.example.listen/Bulletin_$mois-$annee.pdf";

      //String fullPath2 = '${ext![1].path}/Bulletin_$mois-$annee.pdf';
      logger.i(fullPath1);

      tempDirectory(tempDir);
      fullPathTemp(fullPath1);

      response = await dio.get(
        'http://10.100.212.106:3000/newbullpdf/$matricule/$annee/$mois',
        //'http://192.168.43.112:3000/newbullpdf/810386J/$annee/$mois',
        //onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            sendTimeout: const Duration(seconds: 15),
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      logger.i("______________________Edition de bulletin en cours");
      print(response.headers);
      //logger.e(response.data.statutCode);
      //if(response.)
      File file1 = File(fullPathTemp.value);
      file.add(file1);
      var raf = file[0].openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);

      await raf.close();
      //return true;
    } catch (e) {
      print("=========");
      print(e);
      print(false);
    }
    logger.d('CHEMIN:  ${fullPathTemp}');
    //return true;
    // var response = await dio.download(
    //   'http://10.100.212.106:3000/newbullpdf/810386J/2022/12',
    //   '${(await getTemporaryDirectory()).path}bull.pdf',
    // );
  }

  getAllFilesFromPhoneDirectory() async {
    saveDirectory(await getExternalStorageDirectory());
    logger.d(saveDirectory.value.path);
    listeDeFichiers = RxList<File>.empty();
    List contentsFolder;
    contentsFolder =
        saveDirectory.value.listSync(recursive: false, followLinks: false);

    for (FileSystemEntity f in contentsFolder) {
      String path = f.path;
      if (path.contains('Bulletin') && path.endsWith('.pdf')) {
        listeDeFichiers.add(f as File);
      }
    }

    logger.e('${contentsFolder.length}|${listeDeFichiers.length}');
    //logger.e('${contentsFolder.length}|${listeDeFichiers.length}');
  }
}
