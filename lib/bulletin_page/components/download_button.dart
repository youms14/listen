import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';

import '../../api/bulletins_api_controller.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({
    Key? key,
  }) : super(key: key);

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          //child: DecoratedBox(
          //decoration: const BoxDecoration(gradient: kgradient),
          child: SizedBox(
            width: s.width * 0.45,
            height: 50,
            child: ElevatedButton(
                onPressed: () => {
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
                                      onPressed: () => {Navigator.pop(context)},
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
                                      onPressed: () => {Navigator.pop(context)},
                                    )
                                  ],
                                );
                              });
                        }
                      })
                    },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, //Colors.transparent,
                  foregroundColor: Colors.black,
                  //elevation: 3,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: k1c,
                        strokeAlign: 1.5,
                        style: BorderStyle.solid,
                        width: 2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.file_download_outlined,
                        color: k1c,
                        size: 30,
                      ),
                      Text(
                        ' Télécharger',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                )),
          ),
          // ),
        ),
      ],
    );
  }
}
