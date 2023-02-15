import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemBulletin extends StatefulWidget {
  const ItemBulletin({
    super.key,
  });

  @override
  State<ItemBulletin> createState() => _ItemBulletinState();
}

class _ItemBulletinState extends State<ItemBulletin> {
  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: <Widget>[
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
            Get.toNamed("/viewerpdf");
          },
          isDefaultAction: true,
          trailingIcon: CupertinoIcons.doc_on_clipboard,
          child: const Text('Ouvrir'),
        ),
        CupertinoContextMenuAction(
          onPressed: () {
            Navigator.pop(context);
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
          },
          isDestructiveAction: true,
          trailingIcon: CupertinoIcons.delete,
          child: const Text('Supprimer'),
        ),
      ],
      child: Material(
        child: InkWell(
          onTap: () => {
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
                          color: Color.fromARGB(255, 246, 242, 242)
                              .withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16)),
                        ),
                        width: 100,
                        height: 30,
                        child: const Center(
                          child: Text(
                            "12-2022",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(221, 46, 46, 46),
                                fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 110,
                    // height: 50,
                    child: const Text(
                      "Bulletin_12-2022.pdf",
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
