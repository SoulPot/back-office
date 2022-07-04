import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:soulpot_manager/views/manage_data/widgets/plant_card.dart';

import '../../../theme.dart';
import '../../../utilities/firestore.dart';

class PlantsCollectionViewer extends StatefulWidget {
  const PlantsCollectionViewer({Key? key}) : super(key: key);

  @override
  State<PlantsCollectionViewer> createState() => _PlantsCollectionViewerState();
}

class _PlantsCollectionViewerState extends State<PlantsCollectionViewer> {
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: FirestoreManager.getPlants(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Container(
          height: maxHeight / 1.15,
          width: maxWidth / 2.7,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              colors: [
                SoulPotTheme.spGreen,
                SoulPotTheme.spPaleGreen,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: maxHeight / 100, bottom: maxHeight / 100),
                child: Text(
                  "Plantes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: maxWidth / 60,
                    color: SoulPotTheme.spBlack,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Greenhouse',
                  ),
                ),
              ),
              snapshot.connectionState.name == "done"
                  ? ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: Expanded(
                        child: ListView.builder(
                          controller: ScrollController(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return PlantCard(
                                plant: snapshot.data[index],
                                refreshList: refreshList);
                          },
                        ),
                      ),
                    )
                  : SizedBox(
                      height: maxHeight / 1.5,
                      width: maxWidth,
                      child: Center(
                        child: LoadingAnimationWidget.waveDots(
                            color: Colors.black, size: maxWidth / 20),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }

  void refreshList() {
    setState(() {});
  }
}
