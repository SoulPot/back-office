import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:soulpot_manager/theme.dart';
import 'package:soulpot_manager/views/sign_in_view.dart';
import 'package:soulpot_manager/views/add_data/add_data_view.dart';
import 'package:soulpot_manager/views/charts/charts_view.dart';
import 'package:soulpot_manager/views/manage_data/manage_data_view.dart';
import 'package:soulpot_manager/views/manage_objectives/manage_objectives_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late SidebarXController _controller;
  var _views = [];

  @override
  void initState() {
    _views = [
      const ChartsView(),
      const AddDataView(),
      const ManageDataView(),
      const ManageObjectivesView(),
    ];
    _controller = SidebarXController(selectedIndex: widget.selectedIndex);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SoulPotTheme.spBackgroundWhite,
      body: Row(
        children: [
          SidebarX(
            controller: _controller,
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: SoulPotTheme.sideBarCanvasColor,
                borderRadius: BorderRadius.circular(20),
              ),
              textStyle: const TextStyle(
                  color: Colors.white, fontFamily: 'Greenhouse'),
              selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Greenhouse',
                  fontWeight: FontWeight.bold),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              itemDecoration: BoxDecoration(
                border: Border.all(color: SoulPotTheme.sideBarCanvasColor),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: SoulPotTheme.sideBarActionColor.withOpacity(0.37),
                ),
                gradient: const LinearGradient(
                  colors: [
                    SoulPotTheme.sideBarAccentCanvasColor,
                    SoulPotTheme.sideBarCanvasColor
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 30,
                  )
                ],
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
              selectedIconTheme: const IconThemeData(
                color: SoulPotTheme.spGreen,
                size: 20,
              ),
            ),
            extendedTheme: const SidebarXTheme(
              width: 250,
              decoration: BoxDecoration(
                color: SoulPotTheme.sideBarCanvasColor,
              ),
              margin: EdgeInsets.only(right: 10),
            ),
            footerDivider:
                Divider(color: Colors.white.withOpacity(0.3), height: 1),
            headerBuilder: (context, extended) {
              return extended
                  ? Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 1),
                            child: Image.asset('assets/images/LogoSoulPot.png'),
                          ),
                        ),
                        const Text(
                          "Administration",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Greenhouse",
                            color: SoulPotTheme.spGreen,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 1),
                        child:
                            Image.asset('assets/images/SoulPotLogoFlower.png'),
                      ),
                    );
            },
            items: [
              SidebarXItem(
                icon: Icons.home,
                label: 'Home',
                onTap: () {
                  setState(() {
                    _controller.selectIndex(0);
                  });
                },
              ),
              SidebarXItem(
                icon: Icons.add_circle,
                label: 'Ajout de donn??es',
                onTap: () {
                  setState(() {
                    _controller.selectIndex(1);
                  });
                },
              ),
              SidebarXItem(
                icon: Icons.storage_rounded,
                label: 'Gestion des donn??es',
                onTap: () {
                  setState(() {
                    _controller.selectIndex(2);
                  });
                },
              ),
              SidebarXItem(
                icon: Icons.verified,
                label: 'Gestion objectifs',
                onTap: () {
                  setState(() {
                    _controller.selectIndex(3);
                  });
                },
              ),
              SidebarXItem(
                icon: Icons.output_rounded,
                label: 'D??connexion',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                        alignment: Alignment.bottomCenter,
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 600),
                        reverseDuration: const Duration(milliseconds: 600),
                        type: PageTransitionType.fade,
                        child: const SignInView(),
                        childCurrent: context.widget),
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: _views[_controller.selectedIndex],
          ),
        ],
      ),
    );
  }
}
