import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/api/client.dart';
import 'package:listen/constants.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:share_plus/share_plus.dart';

import '../../api/bulletins_api_controller.dart';
import '../controllers/swith_bull_component_controller.dart';
import 'download_button.dart';
import 'item_bulletin.dart';
import 'item_bulletin_listview.dart';
import 'share_button.dart';

class MesBullComponent extends StatefulWidget {
  MesBullComponent({
    super.key,
  });

  @override
  State<MesBullComponent> createState() => _MesBullComponentState();
}

class _MesBullComponentState extends State<MesBullComponent> {
  final SwitchBullComponentController _switchBullComponentController =
      Get.find<SwitchBullComponentController>();
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();

  @override
  void initState() {
    super.initState();
    _switchBullComponentController.setIsListFALSE();
    _bullApiController.getAllFilesFromPhoneDirectory();
  }

  String getMonthYearFromFullPath(String fullpath) {
    return fullpath.split('/').last.split('_').last.split('.').first;
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    XFile xfile;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
        child: //Obx(() =>
            Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: s.width * 0.3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _switchBullComponentController.setIsListFALSE();
                          });
                        },
                        icon: Obx(() => Icon(
                              Icons.image,
                              color: !_switchBullComponentController.getIsList()
                                  ? k1c
                                  : Colors.black,
                              size: 30,
                            ))),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _switchBullComponentController.setIsListTRUE();
                          });
                        },
                        icon: Obx(() => Icon(
                              Icons.list_alt_sharp,
                              color: _switchBullComponentController.getIsList()
                                  ? k1c
                                  : Colors.black,
                              size: 30,
                            ))),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: s.height * 0.66,
            child: SingleChildScrollView(
              child: _switchBullComponentController.getIsList()
                  ? Obx(() => ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: List.generate(
                            _bullApiController.listeDeFichiers.length,
                            (index) => Card(
                                  child: Obx(() => ListTile(
                                        onTap: () => {
                                          setState(() {
                                            _bullApiController.file.clear();
                                            _bullApiController.file.add(
                                                _bullApiController
                                                    .listeDeFichiers[index]);
                                            _bullApiController
                                                .setTitreViewerPage(
                                                    _bullApiController
                                                        .listeDeFichiers[index]
                                                        .path
                                                        .split('/')
                                                        .last);
                                          }),
                                          Get.toNamed("/viewerpdf")
                                        },
                                        leading: ItemBulletinListView(
                                            index: index,
                                            moisAnnee: getMonthYearFromFullPath(
                                                _bullApiController
                                                    .listeDeFichiers[index]
                                                    .path)),
                                        title: Text(_bullApiController
                                            .listeDeFichiers[index].path
                                            .split('/')
                                            .last),
                                        trailing: PopupMenuButton(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                            ),
                                            child: const Icon(Icons.more_vert),
                                            itemBuilder:
                                                (BuildContext context) => [
                                                      PopupMenuItem(
                                                        onTap: () => {
                                                          Navigator.pop(
                                                              context),
                                                          print(
                                                              "____________________________"),

                                                          _bullApiController
                                                              .file
                                                              .clear(),
                                                          _bullApiController
                                                              .file
                                                              .add(_bullApiController
                                                                      .listeDeFichiers[
                                                                  index]),
                                                          _bullApiController
                                                              .setTitreViewerPage(
                                                                  _bullApiController
                                                                      .listeDeFichiers[
                                                                          index]
                                                                      .path
                                                                      .split(
                                                                          '/')
                                                                      .last),

                                                          Get.toNamed(
                                                              "/viewerpdf"),

                                                          // logger.d(
                                                          //     "OUOUOUOUOUOUOUOOUOU")
                                                        },
                                                        child: Row(
                                                          children: const [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .doc_on_clipboard,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "Ouvrir",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      PopupMenuItem(
                                                          onTap: () async {
                                                            xfile = XFile(
                                                                _bullApiController
                                                                    .file[0]
                                                                    .path);
                                                            await Share
                                                                .shareXFiles([
                                                              xfile
                                                            ], text: 'Partager votre bulletin via:');
                                                          },
                                                          child: Row(
                                                            children: const [
                                                              Icon(Icons.share),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text("Partager"),
                                                            ],
                                                          )),
                                                      PopupMenuItem(
                                                          onTap: () {
                                                            //Popup de confirmation
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .question_mark_sharp,
                                                                      color: Colors
                                                                          .red,
                                                                      size: 25,
                                                                    ),
                                                                    title: const Text(
                                                                        "Etes vous sûr(e) de vouloir supprimer ce bulletin?"),
                                                                    actions: [
                                                                      TextButton(
                                                                          onPressed:
                                                                              () async {
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
                                                                                    content: const Text("Bulletin supprimé avec succès."),
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
                                                                          child:
                                                                              const Text(
                                                                            "Ok",
                                                                            style:
                                                                                TextStyle(color: Colors.red),
                                                                          )),
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            "Annuler",
                                                                            style:
                                                                                TextStyle(color: k1c),
                                                                          ))
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                          child: Row(
                                                            children: const [
                                                              Icon(
                                                                Icons.delete,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                "Supprimer",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            ],
                                                          )),
                                                      //const PopupMenuItem(child: Text("Ouvrir")),
                                                    ]),
                                      )),
                                )),
                      ))
                  : ResponsiveGridRow(
                      children: List.generate(
                          _bullApiController.listeDeFichiers.length,
                          (index) => ResponsiveGridCol(
                                xs: 4,
                                md: 2,
                                child: Obx(() => ItemBulletin(
                                    index: index,
                                    name: _bullApiController
                                        .listeDeFichiers[index].path
                                        .split('/')
                                        .last,
                                    moisAnnee: getMonthYearFromFullPath(
                                      _bullApiController
                                          .listeDeFichiers[index].path,
                                    ))),
                              )),
                    ),
            ),
          ),
        ])
        //),
        );
  }
}
