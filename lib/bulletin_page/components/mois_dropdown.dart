import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/bulletins_api_controller.dart';
import '../../constants.dart';

class MoisDropDown extends StatefulWidget {
  const MoisDropDown({super.key});

  @override
  State<MoisDropDown> createState() => _MoisDropDownState();
}

class _MoisDropDownState extends State<MoisDropDown> {
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();
  String dropdownvalueMonth = '';
  var listeMois = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre'
  ];
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();
    dropdownvalueMonth = listeMois[date.month - 1];
    _bullApiController.setMois(date.month.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText: 'Ex: Janvier',
          label: Text(
            'Mois',
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
        value: dropdownvalueMonth,
        items: listeMois.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalueMonth = newValue!;
            _bullApiController.setMois(
                (listeMois.indexOf(dropdownvalueMonth) + 1).toString());
          });
        },
      ),
    );
  }
}
