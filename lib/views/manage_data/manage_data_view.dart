import 'package:flutter/cupertino.dart';
import 'package:soulpot_manager/views/manage_data/widgets/analyzers_collection_viewer.dart';
import 'package:soulpot_manager/views/manage_data/widgets/plants_collection_viewer.dart';

import '../../theme.dart';

class ManageDataView extends StatefulWidget {
  const ManageDataView({Key? key}) : super(key: key);

  @override
  State<ManageDataView> createState() => _ManageDataViewState();
}

class _ManageDataViewState extends State<ManageDataView> {
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
            child: Row(
              children: const [
                Spacer(),
                PlantsCollectionViewer(),
                Spacer(),
                AnalyzersCollectionViewer(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
