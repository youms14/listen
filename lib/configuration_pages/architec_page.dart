import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../api/bulletins_api_controller.dart';
import '../bulletin_page/components/matricule_texfield.dart';
import '../constants.dart';
import 'components/confirm_password_textfield.dart';
import 'components/password_textfield.dart';
import 'components/question1.dart';
import 'components/question2.dart';
import 'components/question3.dart';
import 'components/reponse_textfield.dart';

class ArchitecPage extends StatefulWidget {
  const ArchitecPage({super.key});

  @override
  State<ArchitecPage> createState() => _ArchitecPageState();
}

class _ArchitecPageState extends State<ArchitecPage> {
  int _index = 0;
  Logger logger = Logger();
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();

  //final GlobalKey<FormState> _matriculeFormKey = GlobalKey();
  final myMatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: s.height * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: s.width * 0.8,
                child: Text(
                  "Processus d'Authentification de l'Agent".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      letterSpacing: 2, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme:
                      const ColorScheme.light(primary: k1c, secondary: k2c)),
              child: SingleChildScrollView(
                child: Stepper(
                    onStepCancel: () {},
                    onStepContinue: () {},
                    onStepTapped: (int index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    controlsBuilder: (context, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              if (_index > 0) {
                                setState(() {
                                  _index -= 1;
                                });
                              }
                            },
                            child: const Text(
                              'Précedent',
                              style: TextStyle(
                                  color: Color.fromARGB(137, 44, 43, 43)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_index == 0) {
                                _bullApiController
                                    .matricule(myMatController.text);
                                logger.d(_bullApiController.matricule.value);
                              }

                              if (_index < 4) {
                                setState(() {
                                  _index += 1;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: k2c,
                              //Colors.transparent.withOpacity(0.7),
                              foregroundColor: Colors.black,
                              //elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Text('Suivant'),
                                Icon(Icons.keyboard_double_arrow_down_rounded)
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    physics: ScrollPhysics(),
                    currentStep: _index,
                    //elevation: 7,
                    type: StepperType.vertical,
                    steps: [
                      Step(
                        title: Text("Enregistrement du Matricule"),
                        content: Column(
                          children: [
                            const Text(
                                "Veillez entrer votre matricule en hométant le tiret:"),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20.0, top: 10),
                              //child: MatriculeTextfield(),
                              child: TextFormField(
                                controller: myMatController,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    icon: const Icon(
                                      Icons.person,
                                      size: 35,
                                    ),
                                    hintText: "Ex: 137865T",
                                    //labelText: 'Matricule',
                                    fillColor: const Color.fromARGB(
                                        255, 216, 214, 214),
                                    focusColor: k2c),
                              ),
                            ),
                          ],
                        ),
                        state: (_index == 0)
                            ? StepState.editing
                            : StepState.indexed,
                        isActive: _index == 0,
                      ),
                      Step(
                        title: Text("Numéro de Téléphone"),
                        content: Column(
                          children: [
                            const Text(
                                "Veillez entrer votre numéro de Téléphone:"),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20.0, top: 10),
                              child: TextFormField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    icon: const Icon(
                                      Icons.phone_android_rounded,
                                      size: 35,
                                    ),
                                    hintText: "Ex: 699986014",
                                    //labelText: 'Matricule',
                                    fillColor: const Color.fromARGB(
                                        255, 216, 214, 214),
                                    focusColor: k2c),
                              ),
                            ),
                          ],
                        ),
                        state: (_index == 1)
                            ? StepState.editing
                            : StepState.indexed,
                        isActive: _index == 1,
                      ),
                      Step(
                        title: const Text("Questions de sécurité"),
                        content: Column(
                          children: [
                            const Text(
                                "Choisissez puis répondez à 03 Questions de sécurité:\n\n"),
                            //const Text("Question N° 1:"),
                            SizedBox(width: s.width * 0.9, child: Question1()),
                            const SizedBox(
                              height: 10,
                            ),
                            ReponseTextField(questionNumber: 1),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(width: s.width * 0.9, child: Question2()),
                            const SizedBox(
                              height: 10,
                            ),
                            ReponseTextField(
                              questionNumber: 2,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(width: s.width * 0.9, child: Question3()),
                            const SizedBox(
                              height: 10,
                            ),
                            ReponseTextField(
                              questionNumber: 3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        state: (_index == 2)
                            ? StepState.editing
                            : StepState.indexed,
                        isActive: _index == 2,
                      ),
                      Step(
                        title: const Text(
                            "Enregistrer un mot de passe(Facultative)"),
                        content: Column(
                          children: [
                            const Text(
                                "Voulez vous sécuriser l'accès à votre application? si oui, enregistrez un mot de passe. (Sinon passez directement à l'étape suivante en cliquant sur 'Suivant').\n\n"),
                            PasswordTextfield(),
                            SizedBox(
                              height: 5,
                            ),
                            ConfirmPasswordTextfield(),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        state: (_index == 3)
                            ? StepState.editing
                            : StepState.indexed,
                        isActive: _index == 3,
                      ),
                      Step(
                        title: Text("Acces au Menu Principal de l'application"),
                        content: Row(
                          children: [
                            SizedBox(
                              width: s.width * 0.2,
                            ),
                            IconButton(
                                onPressed: () => {
                                      logger.e("BONjour"),
                                      Get.toNamed("/main"),
                                    },
                                icon: Icon(
                                  Icons.home_rounded,
                                  color: k1c,
                                  size: 100,
                                )),
                          ],
                        ),
                        state: (_index == 4)
                            ? StepState.editing
                            : StepState.indexed,
                        isActive: _index == 4,
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
