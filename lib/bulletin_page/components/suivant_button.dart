import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';

class SuivantButton extends StatefulWidget {
  const SuivantButton({
    Key? key,
  }) : super(key: key);

  @override
  State<SuivantButton> createState() => _SuivantButtonState();
}

class _SuivantButtonState extends State<SuivantButton> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: DecoratedBox(
            decoration: const BoxDecoration(gradient: kgradient),
            child: SizedBox(
              width: s.width * 0.5,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Suivant',
                          style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 2,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
