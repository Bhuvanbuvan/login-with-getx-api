import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String title;
  const SubmitButton({super.key, required this.onpressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide.none)),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.pinkAccent)),
        onPressed: onpressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
