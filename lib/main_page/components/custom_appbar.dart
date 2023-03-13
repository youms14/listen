import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/bulletins_api_controller.dart';
import '../controllers/custom_app_controller.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final CustomAppController _customAppController =
      Get.find<CustomAppController>();
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 66, 146, 89),
          Color.fromARGB(255, 111, 183, 132),
          Color.fromARGB(255, 207, 207, 17),
        ]),
        //borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
      ),
      child: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Obx(() => IconButton(
                    onPressed: () {
                      if (_customAppController.leading.value != "main") {
                        _customAppController.leading("main");
                        Get.back();
                      } else {
                        //Launch Drawer here
                      }
                    },
                    icon: _customAppController.leading.value == "main"
                        ? const Icon(
                            Icons.menu,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                  )),
              title: Row(
                children: [
                  Text(
                    '${_bullApiController.prenom.value}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mail,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      )),
                ],
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
