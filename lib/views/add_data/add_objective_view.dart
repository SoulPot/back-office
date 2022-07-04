import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:soulpot_manager/models/objective.dart';
import 'package:soulpot_manager/utilities/firestore.dart';
import 'package:soulpot_manager/widgets/custom_textfield.dart';

import '../../theme.dart';

class AddObjectiveView extends StatefulWidget {
  const AddObjectiveView({Key? key}) : super(key: key);

  @override
  State<AddObjectiveView> createState() => _AddObjectiveViewState();
}

class _AddObjectiveViewState extends State<AddObjectiveView> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _fieldController = TextEditingController();
  final TextEditingController _objectiveValueController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: SoulPotTheme.spBackgroundWhite,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  colors: [
                    SoulPotTheme.sideBarAccentCanvasColor,
                    SoulPotTheme.sideBarCanvasColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white, size: 30),
                                iconSize: 30,
                                alignment: Alignment.topLeft,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "Informations affichées de l'objectif",
                          style: TextStyle(
                              color: SoulPotTheme.spBackgroundWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Spacer(),
                            SoulPotTextField(
                              tfController: _idController,
                              titleText: "Identifiant de l'objectif",
                              hintText: "Identifiant",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            const Spacer(),
                            SoulPotTextField(
                              tfController: _nameController,
                              titleText: "Nom de l'objectif",
                              hintText: "Nom",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            const Spacer(),
                            SoulPotTextField(
                              tfController: _descriptionController,
                              titleText: "Description de l'objectif",
                              hintText: "Description",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            const Spacer(),
                            SoulPotTextField(
                              tfController: _typeController,
                              titleText: "Difficulté de l'objectif",
                              hintText: "Difficulté",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          "Informations techniques",
                          style: TextStyle(
                              color: SoulPotTheme.spBackgroundWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Spacer(),
                            SoulPotTextField(
                              tfController: _fieldController,
                              titleText: "Champ sur lequel porte l'objectif",
                              hintText: "Champ",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            const Spacer(),
                            SoulPotTextField(
                              tfController: _objectiveValueController,
                              titleText: "Valeur à atteindre",
                              hintText: "Valeur",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [
                                SoulPotTheme.spGreen,
                                SoulPotTheme.spPaleGreen,
                              ],
                            ),
                            color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_idController.text.trim().isEmpty ||
                                  _idController.text.trim().isEmpty ||
                                  _nameController.text.trim().isEmpty ||
                                  _descriptionController.text.trim().isEmpty ||
                                  _typeController.text.trim().isEmpty ||
                                  _objectiveValueController.text.trim().isEmpty ||
                                  _fieldController.text.trim().isEmpty ) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Erreur"),
                                      content: const Text(
                                          "Veuillez remplir tous les champs pour créer une plante"),
                                      actions: [
                                        TextButton(
                                          child: const Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  },
                                );
                              } else {
                                var objective = Objective(
                                  _idController.text,
                                  _nameController.text,
                                  _descriptionController.text,
                                  _fieldController.text,
                                  int.parse(_objectiveValueController.text),
                                  _typeController.text,
                                );
                                FirestoreManager.addObjective(objective)
                                    .then((value) => Navigator.pop(context));
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: maxWidth * 0.1,
                                  vertical: maxHeight * 0.05),
                              child: const Text(
                                "Ajouter une nouvelle plante",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: SoulPotTheme.spBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Greenhouse'),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }

  String replaceWhitespacesUsingRegex(String s, String replace) {
    if (s.isEmpty) {
      return "";
    }

    final pattern = RegExp('\\s+');
    return s.replaceAll(pattern, replace);
  }
}
