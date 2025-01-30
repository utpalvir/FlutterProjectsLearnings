import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/constants.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  const InputWidget({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        //Do something with the user input.
      },
      decoration: kTextFieldDecoration.copyWith(hintText: hintText),
    );
  }
}
