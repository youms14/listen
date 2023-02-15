import 'package:flutter/material.dart';
import 'package:listen/bulletin_page/components/download_button.dart';
import 'package:listen/bulletin_page/components/share_button.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'dart:async';
import '../../constants.dart';
import 'bull_one_component.dart';

import 'item_bulletin.dart';

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
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.e,
        children: [
          SizedBox(
            height: s.height * 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: BullOneComponent(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: SizedBox(
              child: //MatriculeTextfield(),
                  RichText(
                text: TextSpan(
                  text: "NOTE",
                  style: const TextStyle(
                    color: k1c,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ': Vous avez accès uniquement à vos propres bulletins de solde, c\'est-à-dire les bulletins de soldes associés au matricule à votre matricule qui est: ',
                      style: DefaultTextStyle.of(context).style,
                    ),
                    const TextSpan(
                        text: 'C137988',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        )),
                    TextSpan(
                      text: '.',
                      style: DefaultTextStyle.of(context).style,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
