import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../models/objective.dart';
import '../../../theme.dart';
import '../../../utilities/firestore.dart';
import '../../../widgets/delete_confirmation_dialog.dart';
import '../objective_details_view.dart';

class ObjectiveCard extends StatefulWidget {
  const ObjectiveCard({Key? key, required this.objective, required this.refreshList}) : super(key: key);

  final Objective objective;
  final Function() refreshList;

  @override
  State<ObjectiveCard> createState() => _ObjectiveCardState();
}

class _ObjectiveCardState extends State<ObjectiveCard> {
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    Widget deleteButton = TextButton(
      child: const Text(
        "Supprimer",
        style: TextStyle(
          color: Colors.red,
          fontFamily: "Greenhouse",
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () async {
        FirestoreManager.deleteObjective(widget.objective.id).then((value) {
          Navigator.pop(context);
          widget.refreshList();
        });
      },
    );
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: maxWidth / 50, vertical: maxHeight / 200),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          height: maxHeight / 10,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              colors: [
                SoulPotTheme.spPalePurple,
                SoulPotTheme.spPurple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(maxWidth / 100),
            child: Row(
              children: [
                const Spacer(),
                Column(
                  children: [
                    const Spacer(),
                    Text(
                      widget.objective.name,
                      style: TextStyle(
                        fontSize: maxHeight / 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.objective.description,
                      style: TextStyle(
                        fontSize: maxHeight / 75,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: ObjectiveDetailsView(
                          objective: widget.objective,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    color: SoulPotTheme.spGreen,
                    size: maxHeight / 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DeleteConfirmationDialog(
                            name: widget.objective.name,
                            deleteButton: deleteButton);
                      },
                    );
                  },
                  icon: Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                    size: maxHeight / 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
