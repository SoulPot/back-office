import 'package:flutter/cupertino.dart';
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
          child: ObjectivesCollectionViewer(),
             //declare your widgets here
        ),
      ),
    );
  }
}
