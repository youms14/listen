import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../api/bulletins_api_controller.dart';
import '../../constants.dart';

class ItemBulletin extends StatefulWidget {
  ItemBulletin({
    super.key,
    required this.index,
    required this.moisAnnee,
    required this.name,
  });

  int index;
  String moisAnnee;
  String name;

  @override
  State<ItemBulletin> createState() => _ItemBulletinState();
}

class _ItemBulletinState extends State<ItemBulletin> {
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();

  @override
  Widget build(BuildContext context) {
    XFile xfile;
    return CupertinoContextMenu(
      actions: <Widget>[
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              _bullApiController.file.clear();
              _bullApiController.file
                  .add(_bullApiController.listeDeFichiers[widget.index]);
              _bullApiController.setTitreViewerPage(_bullApiController
                  .listeDeFichiers[widget.index].path
                  .split('/')
                  .last);
            });
            Get.toNamed("/viewerpdf");
          },
          isDefaultAction: true,
          trailingIcon: CupertinoIcons.doc_on_clipboard,
          child: const Text('Ouvrir'),
        ),
        CupertinoContextMenuAction(
          onPressed: () async {
            Navigator.pop(context);
            xfile = XFile(_bullApiController.file[0].path);
            await Share.shareXFiles([xfile],
                text: 'Partager votre bulletin via:');
          },
          trailingIcon: Icons.share,
          child: const Text('Partager'),
        ),
        // CupertinoContextMenuAction(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
        //   child: const Text('Copier'),
        // ),
        // CupertinoContextMenuAction(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   trailingIcon: Icons.download,
        //   child: const Text('Télécharger'),
        // ),
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
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
          isDestructiveAction: true,
          trailingIcon: CupertinoIcons.delete,
          child: const Text('Supprimer'),
        ),
      ],
      child: Material(
        child: InkWell(
          onTap: () => {
            //TODO:
            setState(() {
              _bullApiController.file.clear();
              _bullApiController.file
                  .add(_bullApiController.listeDeFichiers[widget.index]);
              _bullApiController.setTitreViewerPage(_bullApiController
                  .listeDeFichiers[widget.index].path
                  .split('/')
                  .last);
            }),
            Get.toNamed("/viewerpdf"),
            print("=======OUVERTURE DU FICHIER"),
          },
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        alignment: const Alignment(0, 0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x00000000)
                                        .withOpacity(0.2),
                                    offset: const Offset(0.5, 3.0),
                                    blurRadius: 0.5,
                                    spreadRadius: 0.2),
                              ]),
                          child: Image.asset("assets/images/iconpdf2.png"),
                        ),
                      ),
                      Container(
                        //color: Colors.black.withOpacity(0.5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 246, 242, 242)
                              .withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                        ),
                        width: 100,
                        height: 30,
                        child: Center(
                          child: Text(
                            widget.moisAnnee,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(221, 46, 46, 46),
                                fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 110,
                    // height: 50,
                    child: Text(
                      widget.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          letterSpacing: 1.5,
                          color: Colors.black),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
