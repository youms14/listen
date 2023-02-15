import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';

class ShareButtonFooter extends StatefulWidget {
  const ShareButtonFooter({
    Key? key,
  }) : super(key: key);

  @override
  State<ShareButtonFooter> createState() => _ShareButtonFooterState();
}

class _ShareButtonFooterState extends State<ShareButtonFooter> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          //child: DecoratedBox(
          //decoration: const BoxDecoration(gradient: kgradient),
          child: SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: k2c, //Colors.transparent,
                  foregroundColor: Colors.black,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    // side: const BorderSide(
                    //     color: k2c,
                    //     strokeAlign: 1.5,
                    //     style: BorderStyle.solid,
                    //     width: 2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ),
          // ),
        ),
      ],
    );
  }
}
