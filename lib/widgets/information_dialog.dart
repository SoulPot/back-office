import 'package:flutter/material.dart';

class InformationDialog extends StatelessWidget {
  const InformationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Soulpot Administration",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Cette web app est le système d'administration du produit Soulpot\n\nUn compte administrateur de l'environnement Soulpot est nécessaire pour se connecter\n\nSi vous êtes administrateur mais que vous n'arrivez pas à vous connecter, adressez-vous à une personne ayant accès à la console d'administration principale",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: Text("OK"),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
