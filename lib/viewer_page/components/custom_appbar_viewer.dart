import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';
import 'package:share_plus/share_plus.dart';

import '../../api/bulletins_api_controller.dart';
import '../../bulletin_page/components/custom_indicator.dart';
import '../../main_page/controllers/custom_app_controller.dart';

class CustomAppBarViewer extends StatefulWidget {
  const CustomAppBarViewer({
    super.key,
  });

  @override
  State<CustomAppBarViewer> createState() => _CustomAppBarViewerState();
}

class _CustomAppBarViewerState extends State<CustomAppBarViewer> {
  // final CustomAppController _customAppController =
  //     Get.find<CustomAppController>();

  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size s = MediaQuery.of(context).size;
    XFile xfile;
    return Container(
      height: 120,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 66, 146, 89),
            Color.fromARGB(255, 111, 183, 132),
            Color.fromARGB(255, 207, 207, 17),
          ]),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Text(
                          _bullApiController.titreViewerPage,
                          style: const TextStyle(color: Colors.white),
                        )),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    IconButton(
                        onPressed: () {
                          _bullApiController.downloadBull().then((value) {
                            if (value) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Icon(
                                        Icons.check_circle_rounded,
                                        color: k1c,
                                        size: 50,
                                      ),
                                      content: Obx(() => Text(
                                          "Bulletin téléchargé avec succès.\n Il se trouve dans le dossier: \n\n${_bullApiController.fullPathSave}.")),
                                      actions: [
                                        TextButton(
                                          child: const Text(
                                            "Ok",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () =>
                                              {Navigator.pop(context)},
                                        )
                                      ],
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Image.asset(
                                        "assets/images/not_available.png",
                                        height: 50,
                                        width: 50,
                                      ),
                                      content: Obx(() => Text(
                                          "Ce bulletin est déjà téléchargé.\n Il se trouve dans le dossier: \n\n${_bullApiController.fullPathSave} de votre smartphone.")),
                                      actions: [
                                        TextButton(
                                          child: const Text(
                                            "Ok",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () =>
                                              {Navigator.pop(context)},
                                        )
                                      ],
                                    );
                                  });
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.download,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () async {
                          //xfile = XFile(_bullApiController.fullPathSave.value);
                          xfile = XFile(_bullApiController.file[0].path);
                          await Share.shareXFiles([xfile],
                              text: 'Partager votre bulletin via:');
                        },
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        )),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {
                      //Popup de confirmation
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              icon: const Icon(
                                Icons.question_mark_sharp,
                                color: Colors.red,
                                size: 25,
                              ),
                              title: const Text(
                                  "Etes vous sûr(e) de vouloir supprimer ce bulletin?"),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      await _bullApiController.file[0].delete();
                                      showCupertinoDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              icon: const Icon(
                                                Icons.check_circle,
                                                color: k1c,
                                                size: 30,
                                              ),
                                              content: const Text(
                                                  "Bulletin supprimé avec succès."),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Get.toNamed("/bulletin");
                                                    },
                                                    child: const Text("Ok"))
                                              ],
                                            );
                                          });
                                    },
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(color: Colors.red),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Annuler",
                                      style: TextStyle(color: k1c),
                                    ))
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
              ),
              //const TabBar(tabs: [Text("Bonjour"), Text("data")])
            ],
          ),
        ),
      ),
    );
  }
}
