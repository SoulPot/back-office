import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soulpot_manager/models/Analyzer.dart';
import 'package:soulpot_manager/utilities/firestore.dart';

import '../../models/Plant.dart';
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
            child: StreamBuilder<QuerySnapshot>(
              stream: FirestoreManager.firestore.collection("analyzers").where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString()).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                print(snapshot.data!.docs);
                return ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return Center(
                          child: ListTile(
                            title: Text(data['plantID'].toString(), style: TextStyle(color: Colors.white),),
                            subtitle: Text(data['battery'].toString(), style: TextStyle(color: Colors.white),),
                          ),
                        );
                      })
                      .toList()
                      .cast(),
                );
              },
            ),
          ),
        ));
  }
}

/*return StreamBuilder<QuerySnapshot>(
      stream: _plantsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()!;
            return ListTile(
              title: Text(data['alias']),
              subtitle: Text(data['max_temp'].toString()),
            );
          }).toList(),
        );
      },
    );*/
