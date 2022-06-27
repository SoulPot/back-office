import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../theme.dart';
import '../../../utilities/firestore.dart';
import 'analyzer_card.dart';

class AnalyzersCollectionViewer extends StatefulWidget {
  const AnalyzersCollectionViewer({Key? key}) : super(key: key);

  @override
  State<AnalyzersCollectionViewer> createState() =>
      _AnalyzersCollectionViewerState();
}

class _AnalyzersCollectionViewerState extends State<AnalyzersCollectionViewer> {
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: FirestoreManager.getAnalyzers(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Container(
          height: maxHeight / 1.15,
          width: maxWidth / 2.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              colors: [
                SoulPotTheme.SPPurple,
                SoulPotTheme.SPPalePurple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: maxHeight / 100, bottom: maxHeight / 100),
                child: Text(
                  "Analyzers",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: maxWidth / 60,
                    color: SoulPotTheme.SPBlack,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Greenhouse',
                  ),
                ),
              ),
              snapshot.connectionState.name == "done"
                  ? ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: Expanded(
                        child: ListView.builder(
                          controller: ScrollController(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            print("analyzer");
                            return AnalyzerCard(
                                analyzer: snapshot.data[index],
                                refreshList: refreshList);
                          },
                        ),
                      ),
                    )
                  : Container(
                      height: maxHeight / 1.5,
                      width: maxWidth,
                      child: Center(
                        child: LoadingAnimationWidget.waveDots(
                            color: Colors.black, size: maxWidth / 20),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }

  void refreshList() {
    setState(() {});
  }
}
