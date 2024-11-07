import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const InputField(
      {super.key, required this.textEditingController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white54,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(bottom: 15),
            focusColor: Colors.white60,
          )),
    );
  }
}
