import 'package:flutter/material.dart';

class CardInfosButton extends StatefulWidget {
  const CardInfosButton({super.key});

  @override
  State<CardInfosButton> createState() => _CardInfosButtonState();
}

class _CardInfosButtonState extends State<CardInfosButton> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => {print("Bulletin Clicked")},
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
        ),
        elevation: 35,
        color: Colors.white, //Color.fromARGB(255, 66, 146, 89),
        child: Container(
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
                    Image.asset('assets/images/details.png'),
                    const Icon(
                      Icons.remove_red_eye,
                      size: 30,
                      color: Color.fromARGB(255, 207, 207, 17),
                    )
                  ],
                ),
                const Text(
                  "Informations",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      letterSpacing: 1.5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
