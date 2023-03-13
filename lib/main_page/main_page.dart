import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/card_bulletin_button.dart';
import 'components/card_enfants_button.dart';
import 'components/card_infos_button.dart';
import 'components/card_nui_button.dart';
import 'components/custom_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: Get.find<CustomAppBar>()),
        body: Stack(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: s.height * 0.035,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 66, 146, 89),
                    Color.fromARGB(255, 111, 183, 132),
                    Color.fromARGB(255, 207, 207, 17),
                  ]),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   height: s.height * 0.001,
                // ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(50.0), //<-- SEE HERE
                  ),
                  color: Colors.black.withOpacity(0.08),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: s.height * 0.15, horizontal: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CardBulletinButton(),
                            CardNuiButton(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [CardInfosButton(), CardEnfantsButton()],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: s.height * 0.04,
                  width: s.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 66, 146, 89),
                        Color.fromARGB(255, 111, 183, 132),
                        Color.fromARGB(255, 207, 207, 17),
                      ]),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50))),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        "Copirigth(c) 2023 CENADI",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
