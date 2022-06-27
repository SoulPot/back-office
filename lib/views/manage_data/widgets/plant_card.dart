import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:soulpot_manager/models/Plant.dart';
import 'package:soulpot_manager/utilities/firestore.dart';
import 'package:soulpot_manager/widgets/delete_confirmation_dialog.dart';
import 'package:soulpot_manager/views/manage_data/PlantDetails.dart';

import '../../../theme.dart';

class PlantCard extends StatefulWidget {
  const PlantCard({Key? key, required Plant plant, required this.refreshList})
      : this.plant = plant,
        super(key: key);

  final Plant plant;
  final Function() refreshList;

  @override
  State<PlantCard> createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    Widget deleteButton = TextButton(
      child: Text(
        "Supprimer",
        style: TextStyle(
          color: Colors.red,
          fontFamily: "Greenhouse",
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () async {
        FirestoreManager.deletePlant(widget.plant.id).then((value) {
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              colors: [
                SoulPotTheme.SPPalePurple,
                SoulPotTheme.SPPurple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(maxWidth / 100),
            child: Row(
              children: [
                Image.network(
                  widget.plant.gifURL,
                  height: maxHeight / 10,
                ),
                Spacer(),
                Column(
                  children: [
                    Spacer(),
                    Text(
                      widget.plant.alias,
                      style: TextStyle(
                        fontSize: maxHeight / 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.plant.display_pid.toUpperCase(),
                      style: TextStyle(
                        fontSize: maxHeight / 75,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: PlantDetailsView(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    color: SoulPotTheme.SPGreen,
                    size: maxHeight / 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DeleteConfirmationDialog(
                            name: widget.plant.alias,
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
