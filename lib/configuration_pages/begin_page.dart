import 'package:flutter/material.dart';
import 'package:listen/constants.dart';

class BeginPage extends StatefulWidget {
  const BeginPage({super.key});

  @override
  State<BeginPage> createState() => _BeginPageState();
}

class _BeginPageState extends State<BeginPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Etape de Configuration".toUpperCase(),
            style: const TextStyle(
                fontSize: 27,
                color: k1c,
                fontFamily: 'Josefin Sans',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: s.height * 0.1,
          ),
          Image.asset("assets/images/config.png"),
          SizedBox(
            height: s.height * 0.1,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: k1c, //Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 18.0, horizontal: s.width * 0.15),
              child: const Text(
                "COMMENCER",
                style: TextStyle(
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Josefin Sans'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
