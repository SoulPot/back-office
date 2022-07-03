import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/Objective.dart';
import '../../theme.dart';
import '../../utilities/firestore.dart';
import '../../widgets/custom_textfield.dart';
import '../HomeView.dart';

class ObjectiveDetailsView extends StatefulWidget {
  const ObjectiveDetailsView({Key? key, required Objective this.objective})
      : super(key: key);

  final Objective objective;

  @override
  State<ObjectiveDetailsView> createState() => _ObjectiveDetailsViewState();
}

class _ObjectiveDetailsViewState extends State<ObjectiveDetailsView> {
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
                      height: MediaQuery.of(context).size.height * 0.90,
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
                                tfController: _nameController,
                                titleText: "Nom de l'objectif",
                                hintText: widget.objective.name,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                              SoulPotTextField(
                                tfController: _descriptionController,
                                titleText: "Description de l'objectif",
                                hintText: widget.objective.description,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                              SoulPotTextField(
                                tfController: _typeController,
                                titleText: "Difficulté de l'objectif",
                                hintText: widget.objective.type,
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
                                hintText: widget.objective.field,
                                width: maxWidth * 0.2,
                                height: maxHeight * 0.15,
                              ),
                              Spacer(),
                              SoulPotTextField(
                                tfController: _objectiveValueController,
                                titleText: "Valeur à atteindre",
                                hintText:
                                    widget.objective.objective_value.toString(),
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
                                      : widget.objective.objective_value,
                                  _typeController.text != ""
                                      ? _typeController.text
                                      : widget.objective.type,
                                );
                                print(context);
                                FirestoreManager.updateObjective(objective)
                                    .then(
                                  (value) => Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: HomeView(
                                        selectedIndex: 3,
                                      ),
                                    ),
                                  ),
                                );
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
