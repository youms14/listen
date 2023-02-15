import 'package:flutter/material.dart';

import '../../constants.dart';

class MatriculeTextfield extends StatelessWidget {
  const MatriculeTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        autofocus: true,
        cursorColor: k1c,
        decoration: const InputDecoration(
          hintText: 'Ex: 128765T',
          label: Text(
            'Matricule',
            style: TextStyle(
                fontSize: 15,
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
      ),
    );
  }
}
