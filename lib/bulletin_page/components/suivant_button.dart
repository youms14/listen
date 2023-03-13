import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/constants.dart';

import '../../api/bulletins_api_controller.dart';

class SuivantButton extends StatefulWidget {
  const SuivantButton({
    Key? key,
  }) : super(key: key);

  @override
  State<SuivantButton> createState() => _SuivantButtonState();
}

class _SuivantButtonState extends State<SuivantButton> {
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();

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
            width: s.width * 0.5,
            height: 50,
            child: ElevatedButton(
                onPressed: () async => {
                      await _bullApiController.getIfHasA20(),
                      if (_bullApiController.hasA20.value)
                        {
                          await _bullApiController.getBull(),
                          _bullApiController.setTitreViewerPage(
                              'Bulletin_${_bullApiController.getMois()}-${_bullApiController.getAnnee()}.pdf'),
                          Get.toNamed("/viewerpdf")
                        }
                      else
                        {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  icon: SizedBox(
                                    child: Image.asset(
                                      "assets/images/not_available.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  title: const Text('Oups!'),
                                  //content: Text('Erreur de document\n$details'),
                                  content: Text(
                                      " Pour ce matriculele, le bulletin du mois ${_bullApiController.mois} de l'année ${_bullApiController.annee} n'est pas encore disponible. Merci de réessayer avec d'autres paramètres."),
                                  actions: <Widget>[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        //Navigator.of(context).pop();
                                        Navigator.pop(context);
                                        Get.toNamed('/bulletin');
                                      },
                                    ),
                                  ],
                                );
                              })
                        }
                    },
                style: ElevatedButton.styleFrom(
                  backgroundColor: k1c, //Colors.transparent,
                  foregroundColor: Colors.black,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
          // ),
        ),
      ],
    );
  }
}
