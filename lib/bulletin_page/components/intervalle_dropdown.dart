import 'package:flutter/material.dart';

import '../../constants.dart';

class IntervalleDropdown extends StatefulWidget {
  const IntervalleDropdown({super.key});

  @override
  State<IntervalleDropdown> createState() => _IntervalleDropdownState();
}

class _IntervalleDropdownState extends State<IntervalleDropdown> {
  var listeIntervalle = ['1', '2', '3'];

  String dropdownvalueIntervalle = "1";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
          hintText:
              'Ex: 2 (Les deux derniers bulletins à partir du mois choisi.)',
          label: Text(
            'Intervalle ',
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
        value: dropdownvalueIntervalle,
        items: listeIntervalle.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalueIntervalle = newValue!;
          });
        },
      ),
    );
  }
}
