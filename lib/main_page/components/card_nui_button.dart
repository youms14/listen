import 'package:flutter/material.dart';

class CardNuiButton extends StatefulWidget {
  const CardNuiButton({super.key});

  @override
  State<CardNuiButton> createState() => _CardNuiButtonState();
}

class _CardNuiButtonState extends State<CardNuiButton> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => {print("NUI Clicked")},
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
          width: s.width * 0.45,
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
                    Image.asset('assets/images/niu.png'),
                    Image.asset('assets/images/dgi2.png')
                  ],
                ),
                const Text(
                  "NIU",
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
