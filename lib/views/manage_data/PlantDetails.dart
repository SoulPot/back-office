import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class PlantDetailsView extends StatefulWidget {
  const PlantDetailsView({Key? key}) : super(key: key);

  @override
  State<PlantDetailsView> createState() => _PlantDetailsViewState();
}

class _PlantDetailsViewState extends State<PlantDetailsView> {
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
                  Padding(
                    padding: EdgeInsets.only(top: maxHeight * 0.01),
                    child: Text("TEST"),
                  ),
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
}
