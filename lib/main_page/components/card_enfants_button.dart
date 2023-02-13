import 'package:flutter/material.dart';

class CardEnfantsButton extends StatefulWidget {
  const CardEnfantsButton({super.key});

  @override
  State<CardEnfantsButton> createState() => _CardEnfantsButtonState();
}

class _CardEnfantsButtonState extends State<CardEnfantsButton> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => {},
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
        ),
        elevation: 35,
        color: Colors.white, //Color.fromARGB(255, 66, 146, 89),
        child: SizedBox(
          width: s.width * 0.46,
          height: s.height * 0.17,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: s.height * 0.02, horizontal: s.width * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/enfants.png'),
                    const Icon(
                      Icons.settings,
                      size: 30,
                      color: Color.fromARGB(255, 207, 207, 17),
                    )
                  ],
                ),
                const Text(
                  "Enfants",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      letterSpacing: 2),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
