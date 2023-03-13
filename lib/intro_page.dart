import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:logger/logger.dart';

import 'constants.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<ContentConfig> listContentConfig = [];
  Logger logger = Logger();

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      ContentConfig(
        title: "Editer son Bulletin".toUpperCase(),
        description:
            "Désormais, plus besoins de tracasseries pour avoir vos bulletins de solde. Tous vos bulletins dans votre pôche!",
        centerWidget: Image.asset(
          "assets/images/bulletins.png",
          width: 230,
        ),
        //pathImage: "assets/images/bulletins.png",
        // widthImage: 150,
        styleTitle: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Rajdhani',
            fontWeight: FontWeight.bold),
        styleDescription: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Josefin Sans',
            fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "Option de Téléchargement".toUpperCase(),
        description:
            "Vous pouvez concerver de façon permanente vos bulletins dans la mémoire de votre smartphone.",
        centerWidget: Image.asset(
          "assets/images/download.png",
          width: 230,
        ),
        //pathImage: "assets/images/download.png",
        backgroundColor: Colors.white,
        //widthImage: 150,
        styleTitle: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'Rajdhani',
            fontWeight: FontWeight.bold),
        styleDescription: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Josefin Sans',
            fontWeight: FontWeight.bold),
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "Option de Partage".toUpperCase(),
        description:
            "Vous pouvez partager un bulletin via whatsApp, facebook, email, etc...",
        centerWidget: Image.asset(
          "assets/images/share2.png",
          width: 230,
        ),
        //pathImage: "assets/images/share2.png",
        backgroundColor: Colors.white,
        //heightImage: 200,
        widthImage: 150,
        styleTitle: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Rajdhani',
            fontWeight: FontWeight.bold),
        styleDescription: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Josefin Sans',
            fontWeight: FontWeight.bold),
      ),
    );

    listContentConfig.add(
      ContentConfig(
        title: "Position Solde".toUpperCase(),
        description:
            "Recevez une notification quand votre position solde(Net à percevoir) est disponible.",
        centerWidget: Image.asset(
          "assets/images/position.png",
          width: 230,
        ),
        //pathImage: "assets/images/position.png",
        backgroundColor: Colors.white,
        //widthImage: 150,
        styleTitle: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Rajdhani',
            fontWeight: FontWeight.bold),
        styleDescription: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Josefin Sans',
            fontWeight: FontWeight.bold),
      ),
    );

    listContentConfig.add(
      ContentConfig(
        title: "Mes Informations".toUpperCase(),
        description:
            "Consulation et mis à jour de vos informations personnelles.",
        centerWidget: Image.asset(
          "assets/images/personnal2.png",
          width: 230,
        ),
        //pathImage: "assets/images/personnal2.png",
        backgroundColor: Colors.white,
        //widthImage: 150,
        styleTitle: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Rajdhani',
            fontWeight: FontWeight.bold),
        styleDescription: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Josefin Sans',
            fontWeight: FontWeight.bold),
      ),
    );
  }

  void onDonePress() {
    logger.e("End of slides");
    Get.toNamed("/architec");
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
      nextButtonStyle:
          ButtonStyle(foregroundColor: MaterialStateProperty.all(k2c)),
      doneButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(k1c),
          backgroundColor: MaterialStateProperty.all(k1c.withOpacity(0.15))),
      skipButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(k2c),
          backgroundColor: MaterialStateProperty.all(k2c.withOpacity(0.15))),
      isAutoScroll: true,
      isLoopAutoScroll: true,
      isShowPrevBtn: true,
      indicatorConfig: const IndicatorConfig(
          colorActiveIndicator: k1c,
          sizeIndicator: 9.4,
          spaceBetweenIndicator: 8,
          typeIndicatorAnimation: TypeIndicatorAnimation.sliding),
    );
  }
}
