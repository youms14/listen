import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../controllers/custom_app_controller.dart';

class CardBulletinButton extends StatefulWidget {
  const CardBulletinButton({super.key});

  @override
  State<CardBulletinButton> createState() => _CardBulletinButtonState();
}

class _CardBulletinButtonState extends State<CardBulletinButton> {
  final CustomAppController _customAppController =
      Get.find<CustomAppController>();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => {
        _customAppController.localPath,
        _customAppController.setLeading('bulletin'),
        Get.toNamed('/bulletin')
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
        ),
        elevation: 35,
        color: Colors.white, //Color.fromARGB(255, 66, 146, 89),
        child: SizedBox(
          width: s.width * 0.46,
          height: s.height * 0.17,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: s.height * 0.02, horizontal: s.width * 0.06),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/bulletin.png'),
                    const Text(
                      "+",
                      style: TextStyle(
                          color: Color.fromARGB(255, 207, 207, 17),
                          fontWeight: FontWeight.w200,
                          fontSize: 50),
                    )
                  ],
                ),
                const Text(
                  "Bulletin",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      letterSpacing: 2),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
