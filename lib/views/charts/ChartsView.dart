import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soulpot_manager/utilities/firestore.dart';
import 'package:soulpot_manager/widgets/dashboard_item.dart';

import '../../theme.dart';

class ChartsView extends StatefulWidget {
  const ChartsView({Key? key}) : super(key: key);

  @override
  State<ChartsView> createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView> {
  final Stream<QuerySnapshot> _plantsStream =
      FirebaseFirestore.instance.collection('plants').snapshots();

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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Tableau de bord',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: SoulPotTheme.SPPalePurple,
                        ),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirestoreManager.firestore
                              .collection("analyzers")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError)
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Text('Loading...');
                              default:
                                return DashboardItem(
                                  title: "Analyzers en cours d'utilisation",
                                  value: snapshot.data!.docs.length,
                                  dark: true,
                                );
                            }
                          },
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: SoulPotTheme.SPGreen,
                        ),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirestoreManager.firestore
                              .collection("users")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError)
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Text('Loading...');
                              default:
                                return DashboardItem(
                                  title: "Utilisateurs inscrits",
                                  value: snapshot.data!.docs.length,
                                  dark: false,
                                );
                            }
                          },
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: SoulPotTheme.SPPaleGreen,
                        ),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirestoreManager.firestore
                              .collection("plants")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError)
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Text('Loading...');
                              default:
                                return DashboardItem(
                                  title: "Plantes disponibles",
                                  value: snapshot.data!.docs.length,
                                  dark: true,
                                );
                            }
                          },
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: SoulPotTheme.SPPurple,
                        ),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirestoreManager.firestore
                              .collection("objectives")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError)
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Text('Loading...');
                              default:
                                return DashboardItem(
                                  title: "Objectifs disponibles",
                                  value: snapshot.data!.docs.length,
                                  dark: false,
                                );
                            }
                          },
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                ]),
              )),
        ));
  }
}
