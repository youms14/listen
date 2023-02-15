import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';

class DownloadButtonFooter extends StatefulWidget {
  const DownloadButtonFooter({
    Key? key,
  }) : super(key: key);

  @override
  State<DownloadButtonFooter> createState() => _DownloadButtonFooterState();
}

class _DownloadButtonFooterState extends State<DownloadButtonFooter> {
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
                  backgroundColor: k1c, //Colors.transparent,
                  foregroundColor: Colors.black,
                  elevation: 9,
                  shape: RoundedRectangleBorder(
                    // side: const BorderSide(
                    //     color: k1c,
                    //     strokeAlign: 1.5,
                    //     style: BorderStyle.solid,
                    //     width: 2),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Icon(
                    Icons.file_download_outlined,
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
