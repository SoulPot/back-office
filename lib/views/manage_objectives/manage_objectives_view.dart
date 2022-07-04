import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soulpot_manager/views/manage_objectives/widgets/objectives_collection_viewer.dart';

import '../../theme.dart';

class ManageObjectivesView extends StatefulWidget {
  const ManageObjectivesView({Key? key}) : super(key: key);

  @override
  State<ManageObjectivesView> createState() => _ManageObjectivesViewState();
}

class _ManageObjectivesViewState extends State<ManageObjectivesView> {
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: maxWidth / 50, vertical: maxHeight / 18),
            child: const ObjectivesCollectionViewer(),
          ),
        ),
      ),
    );
  }
}
