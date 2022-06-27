import 'package:flutter/cupertino.dart';

import '../../theme.dart';

class ManageUsersView extends StatefulWidget {
  const ManageUsersView({Key? key}) : super(key: key);

  @override
  State<ManageUsersView> createState() => _ManageUsersViewState();
}

class _ManageUsersViewState extends State<ManageUsersView> {
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
          child: Container(), //declare your widget here
        ),
      ),
    );
  }
}
