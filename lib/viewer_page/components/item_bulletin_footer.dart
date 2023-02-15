import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemBulletinFooter extends StatefulWidget {
  const ItemBulletinFooter({
    super.key,
  });

  @override
  State<ItemBulletinFooter> createState() => _ItemBulletinFooterState();
}

class _ItemBulletinFooterState extends State<ItemBulletinFooter> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => {
          //Get.toNamed("/viewerpdf"),
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
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0x00000000).withOpacity(0.2),
                                  offset: const Offset(0.5, 3.0),
                                  blurRadius: 0.5,
                                  spreadRadius: 0.2),
                            ]),
                        child: Image.asset("assets/images/iconpdf2.png"),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
