import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/bulletin_page/components/download_button.dart';
import 'package:listen/bulletin_page/components/share_button.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'dart:async';
import '../../api/bulletins_api_controller.dart';
import '../../constants.dart';
import 'bull_one_component.dart';

import 'item_bulletin.dart';

class NewBullComponent extends StatefulWidget {
  const NewBullComponent({
    super.key,
  });

  @override
  State<NewBullComponent> createState() => _NewBullComponentState();
}

class _NewBullComponentState extends State<NewBullComponent> {
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.e,
        children: [
          SizedBox(
            height: s.height * 0.026,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: BullOneComponent(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: SizedBox(
              child: //MatriculeTextfield(),
                  Obx(() => RichText(
                        text: TextSpan(
                          text: "NOTE",
                          style: const TextStyle(
                            color: k1c,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  ': Vous avez accès uniquement à vos propres bulletins de solde, c\'est-à-dire les bulletins associés à votre matricule qui est: ',
                              style: DefaultTextStyle.of(context).style,
                            ),
                            TextSpan(
                                text: '${_bullApiController.matricule}',
                                style: TextStyle(
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                )),
                            TextSpan(
                              text: '.',
                              style: DefaultTextStyle.of(context).style,
                            ),
                          ],
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
