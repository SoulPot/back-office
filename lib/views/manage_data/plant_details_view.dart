import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:soulpot_manager/views/home_view.dart';

import '../../models/plant.dart';
import '../../theme.dart';
import '../../utilities/firestore.dart';
import '../../widgets/custom_textfield.dart';

class PlantDetailsView extends StatefulWidget {
  const PlantDetailsView({Key? key, required this.plant})
      : super(key: key);

  final Plant plant;

  @override
  State<PlantDetailsView> createState() => _PlantDetailsViewState();
}

class _PlantDetailsViewState extends State<PlantDetailsView> {
  final TextEditingController _displayIdController = TextEditingController();
  final TextEditingController _aliasController = TextEditingController();
  final TextEditingController _maxLightController = TextEditingController();
  final TextEditingController _minLightController = TextEditingController();
  final TextEditingController _maxTempController = TextEditingController();
  final TextEditingController _minTempController = TextEditingController();
  final TextEditingController _maxHumidityController = TextEditingController();
  final TextEditingController _familyController = TextEditingController();
  final TextEditingController _recommendationsController = TextEditingController();
  final TextEditingController _plantTypeController = TextEditingController();
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _flowerColorController = TextEditingController();
  final TextEditingController _sowingController = TextEditingController();
  final TextEditingController _minHumidityController = TextEditingController();
  final TextEditingController _gifUrlController = TextEditingController();
  final TextEditingController _pictureUrlController = TextEditingController();
  final TextEditingController _cuttingController = TextEditingController();
  final TextEditingController _plantingController = TextEditingController();
  final TextEditingController _floweringController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _infosController = TextEditingController();
  final TextEditingController _sicknessController = TextEditingController();
  final TextEditingController _shortDescriptionController = TextEditingController();

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
              height: maxHeight,
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
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 1.5,
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
                            "Informations primaires",
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
                                tfController: _aliasController,
                                titleText: "Alias de la plante",
                                hintText: widget.plant.alias,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _displayIdController,
                                titleText: "ID affiché de la plante",
                                hintText: widget.plant.displayPID,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _shortDescriptionController,
                                titleText: "Description courte de la plante",
                                hintText: widget.plant.shortDescription != "" ? widget.plant.shortDescription! : "Famille",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "Gif et Images",
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
                                tfController: _gifUrlController,
                                titleText: "URL du GIF de la plante",
                                hintText: widget.plant.gifURL,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _pictureUrlController,
                                titleText: "URL de l'image de la plante",
                                hintText: widget.plant.pictureURL != null
                                    ? widget.plant.pictureURL!
                                    : "Pas d'url",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "Valeurs recommandées",
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
                                tfController: _maxTempController,
                                titleText: "Température maximale recommandée",
                                hintText: widget.plant.maxTemp.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _minTempController,
                                titleText: "Température minimale recommandée",
                                hintText: widget.plant.minTemp.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _maxHumidityController,
                                titleText: "Humidité maximale recommandée",
                                hintText:
                                    widget.plant.maxHumidity.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _minHumidityController,
                                titleText: "Humidité minimale recommandée",
                                hintText:
                                    widget.plant.minHumidity.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _maxLightController,
                                titleText: "Lux maximum recommandés",
                                hintText: widget.plant.maxLight.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _minLightController,
                                titleText: "Lux minimum recommandés",
                                hintText: widget.plant.minLight.toString(),
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "Informations botaniques et d'entretien",
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
                                tfController: _familyController,
                                titleText: "Famille de la plante",
                                hintText: widget.plant.family != "" ? widget.plant.family! : "Famille",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _plantTypeController,
                                titleText: "Type de plante",
                                hintText: widget.plant.plantType != "" ? widget.plant.plantType! : "intérieur, vivace, ..",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _originController,
                                titleText: "Origine de la plante",
                                hintText: widget.plant.origin != "" ? widget.plant.origin! : "Origine",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _recommendationsController,
                                titleText: "Recommandations pour la plante",
                                hintText: widget.plant.recoText != "" ? widget.plant.recoText! : "sol, taille de pot,..",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _sowingController,
                                titleText: "Semis possible",
                                hintText: widget.plant.sowing != "" ? widget.plant.sowing! : "Oui / Non",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _cuttingController,
                                titleText: "Bouture possible",
                                hintText: widget.plant.cutting != "" ? widget.plant.cutting! : "(Oui / Non)",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _plantingController,
                                titleText: "Saison de plantation",
                                hintText: widget.plant.plantingSeason != "" ? widget.plant.plantingSeason! : "Saison de plantation",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _floweringController,
                                titleText: "Saison de floraison",
                                hintText: widget.plant.floweringSeason != "" ? widget.plant.floweringSeason! : "Saison de floraison",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _flowerColorController,
                                titleText: "Couleur(s) des fleurs ou feuilles",
                                hintText: widget.plant.flowerColor != "" ? widget.plant.flowerColor! : "Couleurs ",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _heightController,
                                titleText: "Hauteur de la plante",
                                hintText: widget.plant.height != "" ? widget.plant.height! : "Hauteur",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _sicknessController,
                                titleText: "Maladies / Parasites / Nuisibles",
                                hintText: widget.plant.sickness != "" ? widget.plant.sickness! : "Maladies, Nuisibles,..",
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _infosController,
                                titleText: "Informations sur la plante",
                                hintText: widget.plant.infos != "" ? widget.plant.infos! : "Informations",
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
                                var plant = Plant(
                                  widget.plant.id,
                                  _displayIdController.text != ""
                                      ? _displayIdController.text
                                      : widget.plant.displayPID,
                                  _aliasController.text != ""
                                      ? _aliasController.text
                                      : widget.plant.alias,
                                  _maxLightController.text != ""
                                      ? int.parse(_maxLightController.text)
                                      : widget.plant.minLight,
                                  _minLightController.text != ""
                                      ? int.parse(_minLightController.text)
                                      : widget.plant.maxLight,
                                  _maxTempController.text != ""
                                      ? int.parse(_maxTempController.text)
                                      : widget.plant.maxTemp,
                                  _minTempController.text != ""
                                      ? int.parse(_minTempController.text)
                                      : widget.plant.minTemp,
                                  _maxHumidityController.text != ""
                                      ? int.parse(_maxHumidityController.text)
                                      : widget.plant.maxHumidity,
                                  _minHumidityController.text != ""
                                      ? int.parse(_minHumidityController.text)
                                      : widget.plant.minHumidity,
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
                                      : widget.plant.flowerColor,
                                  _cuttingController.text != ""
                                      ? _cuttingController.text
                                      : widget.plant.cutting,
                                  _sowingController.text != ""
                                      ? _sowingController.text
                                      : widget.plant.sowing,
                                  _floweringController.text != ""
                                      ? _floweringController.text
                                      : widget.plant.floweringSeason,
                                  _pictureUrlController.text != ""
                                      ? _pictureUrlController.text
                                      : widget.plant.pictureURL,
                                  _plantTypeController.text != ""
                                      ? _plantTypeController.text
                                      : widget.plant.plantType,
                                  _plantingController.text != ""
                                      ? _plantingController.text
                                      : widget.plant.plantingSeason,
                                  _sicknessController.text != ""
                                      ? _sicknessController.text
                                      : widget.plant.sickness!,
                                );
                                FirestoreManager.updatePlant(plant)
                                    .then((value) => Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: const HomeView(selectedIndex: 2,),
                                          ),
                                        ),);
                              },
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
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: maxWidth * 0.1,
                                    vertical: maxHeight * 0.05),
                                child: const Text(
                                  "Valider les modifications",
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
