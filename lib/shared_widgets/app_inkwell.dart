import 'package:flutter/material.dart';

class AppInkWell extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  const AppInkWell({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: child);
  }
}
