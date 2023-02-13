import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listen/bulletin_page/components/annee_dropdown.dart';
import 'package:listen/bulletin_page/components/intervalle_dropdown.dart';
import 'package:listen/bulletin_page/components/mois_dropdown.dart';
import 'package:listen/constants.dart';

import 'matricule_texfield.dart';
import 'suivant_button.dart';

class NewBullComponent extends StatefulWidget {
  const NewBullComponent({
    super.key,
  });

  @override
  State<NewBullComponent> createState() => _NewBullComponentState();
}

class _NewBullComponentState extends State<NewBullComponent> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            MatriculeTextfield(),
            AnneeDropdown(),
            MoisDropDown(),
            IntervalleDropdown(),
            SuivantButton(),
          ],
        ),
      ),
    );
  }
}
