import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({
    Key? key,
  }) : super(key: key);

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
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
            width: s.width * 0.45,
            height: 50,
            child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, //Colors.transparent,
                  foregroundColor: Colors.black,
                  //elevation: 3,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: k1c,
                        strokeAlign: 1.5,
                        style: BorderStyle.solid,
                        width: 2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.file_download_outlined,
                        color: k1c,
                        size: 30,
                      ),
                      Text(
                        ' Télécharger',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                )),
          ),
          // ),
        ),
      ],
    );
  }
}
