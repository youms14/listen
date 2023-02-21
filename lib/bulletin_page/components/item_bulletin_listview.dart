import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api/bulletins_api_controller.dart';
import '../controllers/swith_bull_component_controller.dart';

class ItemBulletinListView extends StatefulWidget {
  ItemBulletinListView(
      {super.key, required this.index, required this.moisAnnee});

  int index;
  String moisAnnee;

  @override
  State<ItemBulletinListView> createState() => _ItemBulletinListViewState();
}

class _ItemBulletinListViewState extends State<ItemBulletinListView> {
  //  final SwitchBullComponentController _switchBullComponentController =
  //     Get.find<SwitchBullComponentController>();
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();
//QuestionController
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => {
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
                    Container(
                      //color: Colors.black.withOpacity(0.5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 246, 242, 242)
                            .withOpacity(0.8),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                      ),
                      width: 50,
                      height: 20,
                      child: Center(
                        child: Text(
                          widget.moisAnnee,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors
                                  .black, // Color.fromARGB(221, 46, 46, 46),
                              fontSize: 13),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
