import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final Function() onPressed;
  final String instrcuction;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.instrcuction,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(textAlign: TextAlign.center, widget.instrcuction),
    );
  }
}
