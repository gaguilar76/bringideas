import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/models/place.dart';
import 'package:bringideas/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPlace extends StatelessWidget {
  final Place item;

  const CardPlace(this.item);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Padding(
        padding: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(PATH_IMG + item.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.name,
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 20.0,
                                  color: Colors.green,
                                ),
                                Expanded(
                                  child: Text(
                                    item.location,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w200),
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _.setPageDetail(1, item);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.green,
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Ver más',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    )),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
