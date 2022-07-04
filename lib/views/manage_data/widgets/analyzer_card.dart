import 'package:flutter/material.dart';
import 'package:soulpot_manager/utilities/firestore.dart';
import 'package:soulpot_manager/widgets/delete_confirmation_dialog.dart';

import '../../../models/analyzer.dart';
import '../../../theme.dart';

class AnalyzerCard extends StatefulWidget {
  const AnalyzerCard(
      {Key? key, required this.analyzer, required this.refreshList})
      : super(key: key);

  final Analyzer analyzer;
  final Function() refreshList;

  @override
  State<AnalyzerCard> createState() => _AnalyzerCardState();
}

class _AnalyzerCardState extends State<AnalyzerCard> {
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
        FirestoreManager.deleteAnalyzer(widget.analyzer.id).then((value) {
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
                SoulPotTheme.spPaleGreen,
                SoulPotTheme.spGreen,
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
                  widget.analyzer.plantGifURL,
                  height: maxHeight / 10,
                ),
                const Spacer(),
                Column(
                  children: [
                    const Spacer(),
                    Text(
                      widget.analyzer.id,
                      style: TextStyle(
                        fontSize: maxHeight / 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.analyzer.plantAlias.toUpperCase(),
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DeleteConfirmationDialog(
                            name: widget.analyzer.id,
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
