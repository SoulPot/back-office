import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  Row(
                    children: [
                      Spacer(),
                      SoulPotTextField(
                        tfController: _gifUrlController,
                        hintText: "URL du GIF de la plante",
                        width: maxWidth * 0.2,
                        height: maxHeight * 0.15,
                      ),
                      Spacer(),
                      SoulPotTextField(
                        tfController: _idController,
                        hintText: "ID de la plante",
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
                        tfController: _displayIdController,
                        hintText: "ID affiché de la plante",
                        width: maxWidth * 0.2,
                        height: maxHeight * 0.15,
                      ),
                      Spacer(),
                      SoulPotTextField(
                        tfController: _aliasController,
                        hintText: "Alias de la plante",
                        width: maxWidth * 0.2,
                        height: maxHeight * 0.15,
                      ),
                      Spacer(),
                      SoulPotTextField(
                        tfController: _maxLightController,
                        hintText: "Lux max recommandé",
                        width: maxWidth * 0.2,
                        height: maxHeight * 0.15,
                      ),
                      Spacer(),
                      SoulPotTextField(
                        tfController: _minLightController,
                        hintText: "Lux min recommandé",
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
                        tfController: _maxTempController,
                        hintText: "Température maximale recommandée",
                        width: maxWidth * 0.2,
                        height: maxHeight * 0.15,
                      ),
                      Spacer(),
                      SoulPotTextField(
                        tfController: _minTempController,
                        hintText: "Température minimale recommandée",
                        width: maxWidth * 0.2,
                        height: maxHeight * 0.15,
                      ),
                      Spacer(),
                      SoulPotTextField(
                        tfController: _maxHumidityController,
                        hintText: "Humidité maximale recommandée",
                        width: maxWidth * 0.2,
                        height: maxHeight * 0.15,
                      ),
                      Spacer(),
                      SoulPotTextField(
                        tfController: _minHumidityController,
                        hintText: "Humidité minimale recommandée",
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
                        if (_idController.text
                            .trim()
                            .isEmpty ||
                            _displayIdController.text
                                .trim()
                                .isEmpty ||
                            _aliasController.text
                                .trim()
                                .isEmpty ||
                            _maxLightController.text
                                .trim()
                                .isEmpty ||
                            _minLightController.text
                                .trim()
                                .isEmpty ||
                            _maxTempController.text
                                .trim()
                                .isEmpty ||
                            _minTempController.text
                                .trim()
                                .isEmpty ||
                            _maxHumidityController.text
                                .trim()
                                .isEmpty ||
                            _minHumidityController.text
                                .trim()
                                .isEmpty) {
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
