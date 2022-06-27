import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog(
      {Key? key, required String name, required Widget deleteButton})
      : this.name = name,
        this.deleteButton = deleteButton,
        super(key: key);

  final String name;
  final Widget deleteButton;

  @override
  Widget build(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Annuler"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    return AlertDialog(
      title: Text("Suppression de $name"),
      content: Text("Etes-vous sûr de vouloir supprimer $name ?"),
      actions: [cancelButton, deleteButton],
    );
  }
}
