import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/config/utils.dart';
import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
        child: Row(
          children: [
            IconButton(
              icon: Image.asset(ICON_USER),
              onPressed: () {},
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Utils.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        //textAlign: TextAlign.left,
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Utils.mailName,
                        style: TextStyle(fontSize: 12.0),
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Icon(
                  Icons.notifications_none_outlined,
                  size: 36.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
