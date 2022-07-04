import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:soulpot_manager/theme.dart';
import 'package:soulpot_manager/views/SignInView.dart';
import 'package:soulpot_manager/views/add_data/AddDataView.dart';
import 'package:soulpot_manager/views/charts/ChartsView.dart';
import 'package:soulpot_manager/views/manage_data/ManageDataView.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = SidebarXController(selectedIndex: 0);
  var _views = [];

  @override
  void initState() {
    _views = [
      ChartsView(),
      AddDataView(),
      ManageDataView(),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SoulPotTheme.SPBackgroundWhite,
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
                gradient: LinearGradient(
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
                color: SoulPotTheme.SPGreen,
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
                        Text(
                          "Administration",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Greenhouse",
                            color: SoulPotTheme.SPGreen,
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
                label: 'Ajout de données',
                onTap: () {
                  setState(() {
                    _controller.selectIndex(1);
                  });
                },
              ),
              SidebarXItem(
                icon: Icons.storage_rounded,
                label: 'Gestion des données',
                onTap: () {
                  setState(() {
                    _controller.selectIndex(2);
                  });
                },
              ),
              SidebarXItem(
                icon: Icons.output_rounded,
                label: 'Déconnexion',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                        alignment: Alignment.bottomCenter,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 600),
                        reverseDuration: Duration(milliseconds: 600),
                        type: PageTransitionType.fade,
                        child: SignInView(),
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
