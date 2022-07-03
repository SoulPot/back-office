import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:soulpot_manager/utilities/firestore.dart';
import 'package:soulpot_manager/widgets/custom_textfield.dart';

import '../../models/Plant.dart';
import '../../theme.dart';

class AddPlantView extends StatefulWidget {
  const AddPlantView({Key? key}) : super(key: key);

  @override
  State<AddPlantView> createState() => _AddPlantViewState();
}

class _AddPlantViewState extends State<AddPlantView> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _displayIdController = TextEditingController();
  TextEditingController _aliasController = TextEditingController();
  TextEditingController _maxLightController = TextEditingController();
  TextEditingController _minLightController = TextEditingController();
  TextEditingController _maxTempController = TextEditingController();
  TextEditingController _minTempController = TextEditingController();
  TextEditingController _maxHumidityController = TextEditingController();
  TextEditingController _minHumidityController = TextEditingController();
  TextEditingController _gifUrlController = TextEditingController();
  TextEditingController _pictureUrlController = TextEditingController();
  TextEditingController _familyController = TextEditingController();
  TextEditingController _recommendationsController = TextEditingController();
  TextEditingController _plantTypeController = TextEditingController();
  TextEditingController _originController = TextEditingController();
  TextEditingController _flowerColorController = TextEditingController();
  TextEditingController _sowingController = TextEditingController();
  TextEditingController _cuttingController = TextEditingController();
  TextEditingController _plantingController = TextEditingController();
  TextEditingController _floweringController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _infosController = TextEditingController();
  TextEditingController _sicknessController = TextEditingController();
  TextEditingController _shortDescriptionController = TextEditingController();

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
                    height: MediaQuery.of(context).size.height * 1.5,
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
                        Text("Informations primaires", style: TextStyle(
                            color: SoulPotTheme.SPBackgroundWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            SoulPotTextField(
                              tfController: _aliasController,
                              titleText: "Alias de la plante",
                              hintText: "Nom",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _idController,
                              titleText: "ID de la plante",
                              hintText: "ID de la plante",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _displayIdController,
                              titleText: "ID affiché de la plante",
                              hintText: "ID affiché de la plante",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _shortDescriptionController,
                              titleText: "Description courte de la plante",
                              hintText: "Description courte",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Text("Gif et Images", style: TextStyle(
                            color: SoulPotTheme.SPBackgroundWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            SoulPotTextField(
                              tfController: _gifUrlController,
                              titleText: "URL du GIF de la plante",
                              hintText: "URL du GIF",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _pictureUrlController,
                              titleText: "URL de l'image de la plante",
                              hintText: "URL de l'image",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Text("Valeurs recommandées", style: TextStyle(
                            color: SoulPotTheme.SPBackgroundWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            SoulPotTextField(
                              tfController: _maxTempController,
                              titleText: "Température maximale recommandée",
                              hintText: "Température maximale",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _minTempController,
                              titleText: "Température minimale recommandée",
                              hintText: "Température minimale",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _maxHumidityController,
                              titleText: "Humidité maximale recommandée",
                              hintText: "Humidité maximale",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _minHumidityController,
                              titleText: "Humidité minimale recommandée",
                              hintText: "Humidité minimale",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            SoulPotTextField(
                              tfController: _maxLightController,
                              titleText: "Lux maximum recommandés",
                              hintText: "Lux max",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _minLightController,
                              titleText: "Lux minimum recommandés",
                              hintText: "Lux min",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Informations botaniques et d'entretien",
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
                              tfController: _familyController,
                              titleText: "Famille de la plante",
                              hintText: "Famille",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _plantTypeController,
                              titleText: "Type de plante",
                              hintText: "intérieur, vivace, ..",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _originController,
                              titleText: "Origine de la plante",
                              hintText: "Origine",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _recommendationsController,
                              titleText:
                              "Recommandations pour la plante",
                              hintText: "sol, taille de pot,..",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            SoulPotTextField(
                              tfController: _sowingController,
                              titleText: "Semis possible",
                              hintText: "Oui / Non",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _cuttingController,
                              titleText: "Bouture possible",
                              hintText: "(Oui / Non)",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _plantingController,
                              titleText: "Saison de plantation",
                              hintText: "Saison de plantation",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _floweringController,
                              titleText: "Saison de floraison",
                              hintText: "Saison de floraison",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            SoulPotTextField(
                              tfController: _flowerColorController,
                              titleText: "Couleur(s) des fleurs ou feuilles",
                              hintText: "Couleurs ",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _heightController,
                              titleText: "Hauteur de la plante",
                              hintText: "Hauteur",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _sicknessController,
                              titleText: "Maladies / Parasites / Nuisibles",
                              hintText: "Maladies, Nuisibles,..",
                              width: maxWidth * 0.2,
                              height: maxHeight * 0.15,
                            ),
                            Spacer(),
                            SoulPotTextField(
                              tfController: _infosController,
                              titleText: "Informations sur la plante",
                              hintText: "Informations",
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
                                  _displayIdController.text.trim().isEmpty ||
                                  _aliasController.text.trim().isEmpty ||
                                  _maxLightController.text.trim().isEmpty ||
                                  _minLightController.text.trim().isEmpty ||
                                  _maxTempController.text.trim().isEmpty ||
                                  _minTempController.text.trim().isEmpty ||
                                  _maxHumidityController.text.trim().isEmpty ||
                                  _minHumidityController.text.trim().isEmpty) {
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
                                var plant = Plant(
                                  _idController.text,
                                  _displayIdController.text,
                                  _aliasController.text,
                                  int.parse(_maxLightController.text),
                                  int.parse(_minLightController.text),
                                  int.parse(_maxTempController.text),
                                  int.parse(_minTempController.text),
                                  int.parse(_maxHumidityController.text),
                                  int.parse(_minHumidityController.text),
                                  _gifUrlController.text,
                                  _familyController.text,
                                  _recommendationsController.text,
                                  _shortDescriptionController.text,
                                  _originController.text,
                                  _infosController.text,
                                  _heightController.text,
                                  _flowerColorController.text,
                                  _cuttingController.text,
                                  _sowingController.text,
                                  _floweringController.text,
                                  _pictureUrlController.text,
                                  _plantTypeController.text,
                                  _plantingController.text,
                                );
                                FirestoreManager.addPlant(plant)
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
