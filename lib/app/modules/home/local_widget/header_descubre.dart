import 'package:flutter/material.dart';

class HeaderDescubre extends StatelessWidget {
  final String title;

  const HeaderDescubre({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        color: Colors.green,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
