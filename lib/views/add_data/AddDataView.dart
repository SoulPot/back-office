import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:soulpot_manager/theme.dart';

import 'AddPlantView.dart';

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
          child: Center(
            child: Column(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: AddPlantView(),
                      ),
                    );
                  },
                  child: Text(
                    "Ajouter une nouvelle plante",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: SoulPotTheme.SPBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Greenhouse'),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: SoulPotTheme.SPPaleGreen,
                    padding: EdgeInsets.symmetric(
                        horizontal: maxWidth / 10, vertical: maxHeight / 30),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                // ElevatedButton(
                //   onPressed: () async {},
                //   child: Text(
                //     "Ajouter un nouvel utilisateur",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //         color: SoulPotTheme.SPBlack,
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         fontFamily: 'Greenhouse'),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     shape: new RoundedRectangleBorder(
                //       borderRadius: new BorderRadius.circular(30.0),
                //     ),
                //     primary: SoulPotTheme.SPPalePurple,
                //     padding: EdgeInsets.symmetric(
                //         horizontal: maxWidth / 10, vertical: maxHeight / 30),
                //     textStyle: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
