import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';
import 'package:listen/viewer_page/components/item_bulletin_footer.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../controllers/swith_bull_component_controller.dart';
import 'download_button.dart';
import 'item_bulletin.dart';
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

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
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
            height: s.height * 0.7,
            child: Obx(() => SingleChildScrollView(
                  child: _switchBullComponentController.getIsList()
                      ? ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            ...List.generate(
                                4,
                                (index) => ListTile(
                                      onTap: () => {Get.toNamed("/viewerpdf")},
                                      leading: const ItemBulletinFooter(),
                                      title: const Text("Bulletin_12-2022.pdf"),
                                      trailing: PopupMenuButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                          ),
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (BuildContext context) =>
                                              [
                                                PopupMenuItem(
                                                    child: Row(
                                                  children: const [
                                                    Icon(
                                                      CupertinoIcons
                                                          .doc_on_clipboard,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Ouvrir",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )),

                                                PopupMenuItem(
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
                                                    child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Supprimer",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                )),
                                                //const PopupMenuItem(child: Text("Ouvrir")),
                                              ]),
                                    ))
                          ],
                        )
                      : ResponsiveGridRow(
                          children: List.generate(
                            //_controllerListeArticle.listeArticles.length,
                            14,
                            (index) => ResponsiveGridCol(
                              xs: 4,
                              md: 2,
                              child: ItemBulletin(),
                            ),
                          ),
                        ),
                )),
          )
        ])
        //),
        );
  }
}
