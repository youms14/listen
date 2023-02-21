import 'package:flutter/material.dart';

import '../../constants.dart';

class ReponseTextField extends StatefulWidget {
  ReponseTextField({super.key, required this.questionNumber});

  int questionNumber;

  @override
  State<ReponseTextField> createState() => _ReponseTextFieldState();
}

class _ReponseTextFieldState extends State<ReponseTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none),
          filled: true,
          icon: const Icon(
            Icons.question_answer_rounded,
            size: 35,
          ),
          hintText: "Reponse N° ${widget.questionNumber}",
          //labelText: 'Matricule',
          fillColor: const Color.fromARGB(255, 216, 214, 214),
          focusColor: k2c),
    );
  }
}
