import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../api/bulletins_api_controller.dart';
import '../../constants.dart';

class MatriculeTextfield extends StatefulWidget {
  const MatriculeTextfield({
    super.key,
  });

  @override
  State<MatriculeTextfield> createState() => _MatriculeTextfieldState();
}

class _MatriculeTextfieldState extends State<MatriculeTextfield> {
  final GlobalKey<FormState> _matriculeFormKey = GlobalKey();
  final myMatController = TextEditingController();
  Logger logger = Logger();
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();

  @override
  void initState() {
    myMatController.addListener(_printLatestValue);
    super.initState();
  }

  void _printLatestValue() {
    print(
        "________________________________________________________________________________");
    logger.e('Second text field: ${myMatController.text}');

    _bullApiController.matricule(myMatController.text);
    logger.d(myMatController.text);
  }

  @override
  void dispose() {
    myMatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myMatController,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none),
          filled: true,
          icon: const Icon(
            Icons.person,
            size: 35,
          ),
          hintText: "Ex: 137865T",
          //labelText: 'Matricule',
          fillColor: const Color.fromARGB(255, 216, 214, 214),
          focusColor: k2c),
    );
  }
}
