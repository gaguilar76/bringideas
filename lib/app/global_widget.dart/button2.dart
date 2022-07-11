import 'package:bringideas/app/config/constants.dart';
import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final String? title;
  final Color? color;
  final VoidCallback? onPressed;

  const Button2({this.title, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
          ),
          primary: color,
        ),
        child: Text(
          title!,
          style: TextStyle(
            fontSize: 12,
            color: kColorTextButton,
          ),
        ),
      ),
    );
  }
}
