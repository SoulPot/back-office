import 'package:flutter/material.dart';
import 'package:soulpot_manager/utilities/authentication.dart';
import 'package:soulpot_manager/widgets/information_dialog.dart';

import '../theme.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    var maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: maxHeight,
        width: maxWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              SoulPotTheme.sideBarAccentCanvasColor,
              SoulPotTheme.sideBarCanvasColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => const InformationDialog(),
                      );
                    },
                    icon: const Icon(Icons.info),
                    color: SoulPotTheme.spGreen,
                    iconSize: 50.0,
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/images/LogoSoulPot.png',
                height: maxHeight / 3,
              ),
              Text("Administration",
                  style: TextStyle(
                      fontSize: maxHeight / 20,
                      fontFamily: "Greenhouse",
                      fontWeight: FontWeight.bold,
                      color: SoulPotTheme.spGreen)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: maxHeight / 20),
                child: Column(
                  children: [
                    Column(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: maxWidth / 5,
                            vertical: maxHeight / 100),
                        child: TextField(
                          controller: _emailController,
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Greenhouse',
                          ),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: SoulPotTheme.spGreen,
                                    width: (maxHeight / 100) / 4),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Colors.grey[800],
                                  fontFamily: 'Greenhouse',
                                  fontSize: 20),
                              hintText: "Email",
                              fillColor: SoulPotTheme.spBackgroundWhite),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: maxWidth / 5, vertical: maxHeight / 25),
                        child: TextField(
                          controller: _passwordController,
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.unspecified,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Greenhouse',
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: SoulPotTheme.spGreen,
                                    width: (maxHeight / 100) / 4),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              filled: true,
                              hintStyle: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 20,
                                fontFamily: 'Greenhouse',
                              ),
                              hintText: "Mot de passe",
                              fillColor: SoulPotTheme.spBackgroundWhite),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: maxHeight / 40),
                        child: ElevatedButton(
                          onPressed: () async {
                            await Authentication.signInWithPwd(
                                context,
                                _emailController.text,
                                _passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            primary: SoulPotTheme.spGreen,
                            padding: EdgeInsets.symmetric(
                                horizontal: maxWidth / 5,
                                vertical: maxHeight / 25),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text(
                            "Connexion",
                            style: TextStyle(
                                fontFamily: "Greenhouse", fontSize: 16),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
