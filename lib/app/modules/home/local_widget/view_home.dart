import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/config/utils.dart';
import 'package:bringideas/app/modules/home/home_controller.dart';
import 'package:bringideas/app/modules/home/local_widget/card_notice.dart';
import 'package:bringideas/app/modules/home/local_widget/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(title: 'Bienvenido ' + Utils.userName),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Al parecer estas en ',
                  style: TextStyle(fontSize: 14.0),
                ),
                Expanded(
                  child: Text(
                    _.strLocality + ', ' + _.strState,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            ICON_CLIMATE,
            width: 200.0,
            height: 200.0,
          ),
          Container(
            width: size.width * .4,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(_.strClimate.toString(),
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600)),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 20.0,
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Text(_.strLocality +
                          ', ' +
                          _.strState +
                          ' ' +
                          _.strCountry),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mantente al día con las noticias de ' + _.strLocality,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultPadding, right: kDefaultPadding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Actualmente la gente está comentando sobre estas noticias:',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          for (var i = 0; i < _.listNotice.length; i++)
            CardNotice(_.listNotice[i].title, _.listNotice[i].subtitle,
                _.listNotice[i].image),
        ],
      ),
    );
  }
}
