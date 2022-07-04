import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soulpot_manager/models/Objective.dart';
import 'package:soulpot_manager/utilities/firestore.dart';
import 'package:soulpot_manager/widgets/custom_textfield.dart';

import '../../theme.dart';

class AddObjectiveView extends StatefulWidget {
  const AddObjectiveView({Key? key}) : super(key: key);

  @override
  State<AddObjectiveView> createState() => _AddObjectiveViewState();
}

class _AddObjectiveViewState extends State<AddObjectiveView> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _fieldController = TextEditingController();
  TextEditingController _objectiveValueController = TextEditingController();
  TextEditingController _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: SoulPotTheme.SPBackgroundWhite,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
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
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white, size: 30),
                                iconSize: 30,
                                alignment: Alignment.topLeft,
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Informations affichées de l'objectif",
                          style: TextStyle(
                              color: SoulPotTheme.SPBackgroundWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            SoulPotTextField(
                              tfController: _idController,
                              titleText: "Identifiant de l'objectif",
                              hintText: "Identifiant",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _nameController,
                              titleText: "Nom de l'objectif",
                              hintText: "Nom",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _descriptionController,
                              titleText: "Description de l'objectif",
                              hintText: "Description",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _typeController,
                              titleText: "Difficulté de l'objectif",
                              hintText: "Difficulté",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Informations techniques",
                          style: TextStyle(
                              color: SoulPotTheme.SPBackgroundWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            SoulPotTextField(
                              tfController: _fieldController,
                              titleText: "Champ sur lequel porte l'objectif",
                              hintText: "Champ",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _objectiveValueController,
                              titleText: "Valeur à atteindre",
                              hintText: "Valeur",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [
                                SoulPotTheme.SPGreen,
                                SoulPotTheme.SPPaleGreen,
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
                                      title: Text("Erreur"),
                                      content: Text(
                                          "Veuillez remplir tous les champs pour créer une plante"),
                                      actions: [
                                        TextButton(
                                          child: Text("OK"),
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
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: maxWidth * 0.1,
                                  vertical: maxHeight * 0.05),
                              child: Text(
                                "Ajouter une nouvelle plante",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: SoulPotTheme.SPBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Greenhouse'),
                              ),
                            ),
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
                          ),
                        ),
                        Spacer(),
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
