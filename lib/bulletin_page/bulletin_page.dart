import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/bulletins_api_controller.dart';
import 'components/custom_appbar_bull.dart';
import 'components/mes_bull_component.dart';
import 'components/new_bull_component.dart';
import 'controllers/swith_bull_component_controller.dart';

class BulletinPage extends StatefulWidget {
  const BulletinPage({super.key});

  @override
  State<BulletinPage> createState() => _BulletinPageState();
}

class _BulletinPageState extends State<BulletinPage> {
  final SwitchBullComponentController _switchBullComponentController =
      Get.find<SwitchBullComponentController>();
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();
  @override
  void initState() {
    super.initState();
    //Get.put(BulletinApiController());
    //_bullApiController.getAllFilesFromPhoneDirectory();
    _switchBullComponentController.setIsListFALSE();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(160.0),
            child: Get.find<CustomAppBarBull>()), //Get.find<CustomAppBar>()),
        body: TabBarView(children: [
          NewBullComponent(),
          MesBullComponent(),
          Column(
            children: [Text("Aide Bull"), Text("Bull")],
          ),
        ]),
      ),
    );
  }
}
