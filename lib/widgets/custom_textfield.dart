import 'package:flutter/material.dart';

import '../theme.dart';

class SoulPotTextField extends StatelessWidget {
  const SoulPotTextField(
      {Key? key,
      required this.tfController,
      required this.titleText,
      required this.width,
      required this.height,
      required this.hintText})
      : super(key: key);

  final TextEditingController tfController;
  final String titleText;
  final double width;
  final double height;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Color(0xFF8484E0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(titleText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: SoulPotTheme.spBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Greenhouse')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (_) {},
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Color(0xFF453A3A)),
                  suffixStyle: const TextStyle(color: SoulPotTheme.spBlack),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: SoulPotTheme.spBlack,
                      width: 2,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                      color: SoulPotTheme.spBlack,
                      width: 2,
                    ),
                  ),
                ),
                cursorColor: SoulPotTheme.spBlack,
                controller: tfController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
