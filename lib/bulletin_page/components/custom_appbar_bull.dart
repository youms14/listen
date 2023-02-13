import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';

import '../../bulletin_page/components/custom_indicator.dart';
import '../../main_page/controllers/custom_app_controller.dart';

class CustomAppBarBull extends StatefulWidget {
  const CustomAppBarBull({
    super.key,
  });

  @override
  State<CustomAppBarBull> createState() => _CustomAppBarBullState();
}

class _CustomAppBarBullState extends State<CustomAppBarBull> {
  final CustomAppController _customAppController =
      Get.find<CustomAppController>();
  @override
  Widget build(BuildContext context) {
    //Size s = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 66, 146, 89),
                Color.fromARGB(255, 111, 183, 132),
                Color.fromARGB(255, 207, 207, 17),
              ]),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
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
                        const Text(
                          'Bonjour Alex',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 55,
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
                  //const TabBar(tabs: [Text("Bonjour"), Text("data")])
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.05),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20))),
          child: TabBar(

              //indicatorColor: const Color.fromARGB(255, 66, 146, 89),
              indicatorWeight: 5,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              indicator: CustomIndicator(color: k1c, radius: 3),
              // indicator: const ShapeDecoration(
              //     gradient: kgradient,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(10),
              //       bottomRight: Radius.circular(10),
              //     ))),
              tabs: const [
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                //   child: Row(
                //     children: const [
                //       Icon(Icons.edit),
                //       Text("New Bull"),
                //     ],
                //   ),
                // ),
                Tab(
                  iconMargin: EdgeInsets.only(bottom: 2),
                  text: "New Bull",
                  icon: Icon(Icons.edit),
                ),
                Tab(
                  iconMargin: EdgeInsets.only(bottom: 2),
                  text: "Mes Bull",
                  icon: Icon(Icons.file_download_outlined),
                ),
                Tab(
                  iconMargin: EdgeInsets.only(bottom: 2),
                  text: "Aide",
                  icon: Icon(Icons.help),
                ),
              ]),
        )
      ],
    );
  }
}
