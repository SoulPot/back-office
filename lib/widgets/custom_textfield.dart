import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SoulPotTextField extends StatelessWidget {
  const SoulPotTextField(
      {Key? key,
      required TextEditingController tfController,
      required String hintText,
      required double width,
      required double height})
      : this.width = width,
        this.height = height,
        this.hintText = hintText,
        this.tfController = tfController,
        super(key: key);

  final TextEditingController tfController;
  final String hintText;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Color(0xFF8484E0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(hintText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: SoulPotTheme.SPBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Greenhouse')),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (_) {},
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color(0xFF453A3A)),
                  suffixStyle: TextStyle(color: SoulPotTheme.SPBlack),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: SoulPotTheme.SPBlack,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: SoulPotTheme.SPBlack,
                      width: 2,
                    ),
                  ),
                ),
                cursorColor: SoulPotTheme.SPBlack,
                controller: tfController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
