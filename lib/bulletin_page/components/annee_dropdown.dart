import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/bulletins_api_controller.dart';
import '../../constants.dart';

class AnneeDropdown extends StatefulWidget {
  const AnneeDropdown({super.key});

  @override
  State<AnneeDropdown> createState() => _AnneeDropdownState();
}

class _AnneeDropdownState extends State<AnneeDropdown> {
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();
  var currentdate = DateTime.now();
  int currentYear = 0;
  String dropdownvalueYear = '';
  List<String> fixedLengthList = [];

  @override
  void initState() {
    super.initState();
    currentYear = currentdate.year;
    fixedLengthList = List<String>.generate(
        30, (int index) => (currentYear - index).toString(),
        growable: false);
    dropdownvalueYear = currentYear.toString();
    _bullApiController.setAnnee(dropdownvalueYear);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: 'Ex: 2023',
          label: Text(
            'Année',
            style: TextStyle(
                fontSize: 20,
                letterSpacing: 2.5,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          fillColor: k2c,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: k1c, width: 2.0),
          ),
          border: OutlineInputBorder(),
          //labelText: 'Entrez un matricule',
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        value: dropdownvalueYear,
        items: fixedLengthList.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalueYear = newValue!;
            _bullApiController.setAnnee(dropdownvalueYear);
          });
        },
      ),
    );
  }
}
