import 'package:flutter/material.dart';

import 'annee_dropdown.dart';

import 'matricule_texfield.dart';
import 'mois_dropdown.dart';
import 'suivant_button.dart';

class BullOneComponent extends StatelessWidget {
  const BullOneComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Card(
        //shape: ShapeBorder(sol),
        color: Colors.white,
        elevation: 9,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: s.height * 0.07, left: 2, right: 2, top: s.height * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnneeDropdown(),
              MoisDropDown(),
              SizedBox(
                height: 20,
              ),
              SuivantButton(),
            ],
          ),
        ),
      ),
    );
  }
}
