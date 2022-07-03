import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:soulpot_manager/views/HomeView.dart';

import '../../models/Plant.dart';
import '../../theme.dart';
import '../../utilities/firestore.dart';
import '../../widgets/custom_textfield.dart';

class PlantDetailsView extends StatefulWidget {
  const PlantDetailsView({Key? key, required Plant this.plant})
      : super(key: key);

  final Plant plant;

  @override
  State<PlantDetailsView> createState() => _PlantDetailsViewState();
}

class _PlantDetailsViewState extends State<PlantDetailsView> {
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
              height: maxHeight,
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
              child: Padding(
                padding: EdgeInsets.only(top: maxHeight * 0.01),
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
                          Text(
                            "Informations primaires",
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
                                tfController: _aliasController,
                                titleText: "Alias de la plante",
                                hintText: widget.plant.alias,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                              SoulPotTextField(
                                tfController: _displayIdController,
                                titleText: "ID affiché de la plante",
                                hintText: widget.plant.display_pid,
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
                          Text(
                            "Gif et Images",
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
                                tfController: _gifUrlController,
                                titleText: "URL du GIF de la plante",
                                hintText: widget.plant.gifURL,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                              SoulPotTextField(
                                tfController: _pictureUrlController,
                                titleText: "URL de l'image de la plante",
                                hintText: widget.plant.picture_url != null
                                    ? widget.plant.picture_url!
                                    : "Pas d'url",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "Valeurs recommandées",
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
                                tfController: _maxTempController,
                                titleText: "Température maximale recommandée",
                                hintText: widget.plant.max_temp.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                              SoulPotTextField(
                                tfController: _minTempController,
                                titleText: "Température minimale recommandée",
                                hintText: widget.plant.min_temp.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                              SoulPotTextField(
                                tfController: _maxHumidityController,
                                titleText: "Humidité maximale recommandée",
                                hintText:
                                    widget.plant.max_soil_moist.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                              SoulPotTextField(
                                tfController: _minHumidityController,
                                titleText: "Humidité minimale recommandée",
                                hintText:
                                    widget.plant.min_soil_moist.toString(),
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
                                hintText: widget.plant.max_light_lux.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                              SoulPotTextField(
                                tfController: _minLightController,
                                titleText: "Lux minimum recommandés",
                                hintText: widget.plant.min_light_lux.toString(),
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
                                titleText: "Recommandations pour la plante",
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
                                var plant = Plant(
                                  widget.plant.id,
                                  _displayIdController.text != ""
                                      ? _displayIdController.text
                                      : widget.plant.display_pid,
                                  _aliasController.text != ""
                                      ? _aliasController.text
                                      : widget.plant.alias,
                                  _maxLightController.text != ""
                                      ? int.parse(_maxLightController.text)
                                      : widget.plant.min_light_lux,
                                  _minLightController.text != ""
                                      ? int.parse(_minLightController.text)
                                      : widget.plant.max_light_lux,
                                  _maxTempController.text != ""
                                      ? int.parse(_maxTempController.text)
                                      : widget.plant.max_temp,
                                  _minTempController.text != ""
                                      ? int.parse(_minTempController.text)
                                      : widget.plant.min_temp,
                                  _maxHumidityController.text != ""
                                      ? int.parse(_maxHumidityController.text)
                                      : widget.plant.max_soil_moist,
                                  _minHumidityController.text != ""
                                      ? int.parse(_minHumidityController.text)
                                      : widget.plant.min_soil_moist,
                                  _gifUrlController.text != ""
                                      ? _gifUrlController.text
                                      : widget.plant.gifURL,
                                  _familyController.text != ""
                                      ? _familyController.text
                                      : widget.plant.family,
                                  _recommendationsController.text != ""
                                      ? _recommendationsController.text
                                      : widget.plant.recoText,
                                  _shortDescriptionController.text != ""
                                      ? _shortDescriptionController.text
                                      : widget.plant.shortDescription,
                                  _originController.text != ""
                                      ? _originController.text
                                      : widget.plant.origin,
                                  _infosController.text != ""
                                      ? _infosController.text
                                      : widget.plant.infos,
                                  _heightController.text != ""
                                      ? _heightController.text
                                      : widget.plant.height,
                                  _flowerColorController.text != ""
                                      ? _flowerColorController.text
                                      : widget.plant.flower_color,
                                  _cuttingController.text != ""
                                      ? _cuttingController.text
                                      : widget.plant.cutting,
                                  _sowingController.text != ""
                                      ? _sowingController.text
                                      : widget.plant.sowing,
                                  _floweringController.text != ""
                                      ? _floweringController.text
                                      : widget.plant.flowering_season,
                                  _pictureUrlController.text != ""
                                      ? _pictureUrlController.text
                                      : widget.plant.picture_url,
                                  _plantTypeController.text != ""
                                      ? _plantTypeController.text
                                      : widget.plant.plant_type,
                                  _plantingController.text != ""
                                      ? _plantingController.text
                                      : widget.plant.planting_season,
                                );
                                print(context);
                                FirestoreManager.updatePlant(plant)
                                    .then((value) => Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: HomeView(selectedIndex: 2,),
                                          ),
                                        ),);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: maxWidth * 0.1,
                                    vertical: maxHeight * 0.05),
                                child: Text(
                                  "Valider les modifications",
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
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
