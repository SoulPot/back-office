import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/objective.dart';
import '../../theme.dart';
import '../../utilities/firestore.dart';
import '../../widgets/custom_textfield.dart';
import '../home_view.dart';

class ObjectiveDetailsView extends StatefulWidget {
  const ObjectiveDetailsView({Key? key, required this.objective})
      : super(key: key);

  final Objective objective;

  @override
  State<ObjectiveDetailsView> createState() => _ObjectiveDetailsViewState();
}

class _ObjectiveDetailsViewState extends State<ObjectiveDetailsView> {
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
                      height: MediaQuery.of(context).size.height * 0.90,
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
                                tfController: _nameController,
                                titleText: "Nom de l'objectif",
                                hintText: widget.objective.name,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _descriptionController,
                                titleText: "Description de l'objectif",
                                hintText: widget.objective.description,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _typeController,
                                titleText: "Difficulté de l'objectif",
                                hintText: widget.objective.type,
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
                                hintText: widget.objective.field,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              const Spacer(),
                              SoulPotTextField(
                                tfController: _objectiveValueController,
                                titleText: "Valeur à atteindre",
                                hintText:
                                    widget.objective.objectiveValue.toString(),
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
                                var objective = Objective(
                                  widget.objective.id,
                                  _nameController.text != ""
                                      ? _nameController.text
                                      : widget.objective.name,
                                  _descriptionController.text != ""
                                      ? _descriptionController.text
                                      : widget.objective.description,
                                  _fieldController.text != ""
                                      ? _fieldController.text
                                      : widget.objective.field,
                                  _objectiveValueController.text != ""
                                      ? int.parse(
                                          _objectiveValueController.text)
                                      : widget.objective.objectiveValue,
                                  _typeController.text != ""
                                      ? _typeController.text
                                      : widget.objective.type,
                                );
                                FirestoreManager.updateObjective(objective)
                                    .then(
                                  (value) => Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: const HomeView(
                                        selectedIndex: 3,
                                      ),
                                    ),
                                  ),
                                );
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
