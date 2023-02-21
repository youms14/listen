import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';

import 'package:share_plus/share_plus.dart';

import '../../api/bulletins_api_controller.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();

  @override
  void initState() {
    super.initState();
    //XFile xfile;
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    XFile xfile;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          //child: DecoratedBox(
          //decoration: const BoxDecoration(gradient: kgradient),
          child: SizedBox(
            width: s.width * 0.42,
            height: 50,
            child: ElevatedButton(
                onPressed: () async {
                  //xfile = XFile(_bullApiController.fullPathSave.value),
                  xfile = XFile(_bullApiController.file[0].path);
                  await Share.shareXFiles([xfile],
                      text: 'Partager votre bulletin via:');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, //Colors.transparent,
                  foregroundColor: Colors.black,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: k2c,
                        strokeAlign: 1.5,
                        style: BorderStyle.solid,
                        width: 2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.share,
                        color: k2c,
                        size: 30,
                      ),
                      Text(
                        '  Partager',
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
