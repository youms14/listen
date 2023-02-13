import 'package:flutter/material.dart';

import '../../constants.dart';

class AnneeDropdown extends StatefulWidget {
  const AnneeDropdown({super.key});

  @override
  State<AnneeDropdown> createState() => _AnneeDropdownState();
}

class _AnneeDropdownState extends State<AnneeDropdown> {
  String dropdownvalueYear = '2023';
  var listeAnnees = [
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
  ];

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
        items: listeAnnees.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalueYear = newValue!;
          });
        },
      ),
    );
  }
}