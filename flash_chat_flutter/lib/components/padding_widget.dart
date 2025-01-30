import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  final String paddingText;
  final void Function() onPressed;
  final Color color;
  const PaddingWidget(
      {required this.paddingText,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            paddingText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
