import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';

import '../../bulletin_page/components/custom_indicator.dart';
import '../../main_page/controllers/custom_app_controller.dart';

class CustomAppBarViewer extends StatefulWidget {
  const CustomAppBarViewer({
    super.key,
  });

  @override
  State<CustomAppBarViewer> createState() => _CustomAppBarViewerState();
}

class _CustomAppBarViewerState extends State<CustomAppBarViewer> {
  final CustomAppController _customAppController =
      Get.find<CustomAppController>();
  @override
  Widget build(BuildContext context) {
    //Size s = MediaQuery.of(context).size;
    return Container(
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
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Bulletin_12-2022.pdf',
                      style: TextStyle(color: Colors.white),
                    ),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.download,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        )),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
              ),
              //const TabBar(tabs: [Text("Bonjour"), Text("data")])
            ],
          ),
        ),
      ),
    );
  }
}
