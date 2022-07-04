import 'package:flutter/material.dart';

import '../theme.dart';

class DashboardItem extends StatefulWidget {
  const DashboardItem(
      {Key? key, required this.title, required this.value, required this.dark})
      : super(key: key);

  final String title;
  final int value;
  final bool dark;

  @override
  State<DashboardItem> createState() => _DashboardItemState();
}

class _DashboardItemState extends State<DashboardItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: widget.dark ? Colors.black : Colors.white),
            ),
            const Spacer(),
            Text(
              "${widget.value}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                  color: widget.dark ? Colors.black : Colors.white),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
