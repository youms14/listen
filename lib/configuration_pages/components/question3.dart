import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../controllers/question_controller.dart';

class Question3 extends StatefulWidget {
  const Question3({super.key});

  @override
  State<Question3> createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  String question3 = "";
  final QuestionController _questionController = Get.find<QuestionController>();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isDense: false,
      itemHeight: 48,
      isExpanded: true,
      decoration: InputDecoration(
        //filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide()),
        fillColor: const Color.fromARGB(255, 216, 214, 214),
        focusColor: k2c,
        hintText: 'Question N°3:',
        label: const Text(
          'Question N°3',
          style: TextStyle(
              fontSize: 20,
              letterSpacing: 2.5,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: k1c, width: 2.0),
        ),
        //border: OutlineInputBorder(),
        //labelText: 'Entrez un matricule',
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      value: question3,
      items: _questionController.listeQuestions.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          question3 = newValue!;
        });
      },
    );
  }
}
