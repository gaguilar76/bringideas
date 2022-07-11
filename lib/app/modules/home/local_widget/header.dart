import 'dart:ui';

import 'package:bringideas/app/config/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      height: 80.0,
      child: Row(
        children: [
          IconButton(
            icon: Image.asset(ICON_LIST),
            onPressed: () {},
          ),
          Expanded(
              child: Text(
            title,
            textAlign: TextAlign.center,
          )),
          IconButton(
            icon: Image.asset(ICON_USER),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
