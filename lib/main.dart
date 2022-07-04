import 'package:flutter/material.dart';
import 'package:soulpot_manager/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SoulPotManager());
}

class SoulPotManager extends StatelessWidget {
  const SoulPotManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SoulPot Manager',
      home: HomeView(selectedIndex: 0),
    );
  }
}
