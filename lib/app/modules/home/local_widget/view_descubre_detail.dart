import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/modules/home/home_controller.dart';
import 'package:bringideas/app/modules/home/local_widget/carousel_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewDescubreDetail extends StatefulWidget {
  @override
  State<ViewDescubreDetail> createState() => _ViewDescubreDetailState();
}

class _ViewDescubreDetailState extends State<ViewDescubreDetail> {
  int indexView = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _.itemPlace.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20.0,
                          color: Colors.green,
                        ),
                        Expanded(
                          child: Text(
                            _.itemPlace.location,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Container(
                    child: CarouselImage(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_filled_outlined,
                        size: 20.0,
                        color: Colors.green,
                      ),
                      Text(
                        ' Abierto de ',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _.itemPlace.detail.days,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _.itemPlace.detail.hours,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        indexView = 0;
                      });
                    },
                    child: Text(
                      'Más información',
                      style: TextStyle(
                        decoration: indexView == 0
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        indexView = 1;
                      });
                    },
                    child: Text(
                      'Visita el museo',
                      style: TextStyle(
                        decoration: indexView == 1
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              indexView == 0
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: kDefaultPadding, right: kDefaultPadding),
                      child: Container(
                        child: Text(_.itemPlace.detail.info),
                      ),
                    )
                  : Container(),
            ]),
          )
        ],
      ),
    );
  }
}
