import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:soulpot_manager/theme.dart';

import 'add_objective_view.dart';
import 'add_plant_view.dart';

class AddDataView extends StatefulWidget {
  const AddDataView({Key? key}) :
        super(key: key);

  @override
  State<AddDataView> createState() => _AddDataViewState();
}

class _AddDataViewState extends State<AddDataView> {
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Container(
      color: SoulPotTheme.spBackgroundWhite,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
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
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const AddPlantView(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    primary: SoulPotTheme.spPaleGreen,
                    padding: EdgeInsets.symmetric(
                        horizontal: maxWidth / 10, vertical: maxHeight / 30),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const AddObjectiveView(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    primary: SoulPotTheme.spPaleGreen,
                    padding: EdgeInsets.symmetric(
                        horizontal: maxWidth / 10, vertical: maxHeight / 30),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    "Ajouter un nouvel objectif",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: SoulPotTheme.spBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Greenhouse'),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
