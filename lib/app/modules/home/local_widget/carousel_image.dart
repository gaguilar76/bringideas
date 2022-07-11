import 'package:bringideas/app/config/constants.dart';
import 'package:bringideas/app/modules/home/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselImage extends StatefulWidget {
  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  final controller = CarouselController();
  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: _.itemPlace.detail.images.length > 0
                  ? _.itemPlace.detail.images.length
                  : 0,
              options: CarouselOptions(
                height: 180.0,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return _.itemPlace.detail.images.length > 0
                    ? Container(
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: AlignmentDirectional.topCenter,
                          fit: StackFit.loose,
                          children: <Widget>[
                            Container(
                              height: 170,
                              width: MediaQuery.of(context).size.width * 0.80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(PATH_IMG +
                                      _.itemPlace.detail.images[index]
                                          .toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container();
              },
            ),
            buildIndicator(_.itemPlace.detail.images.length),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(int length) => AnimatedSmoothIndicator(
        activeIndex: currentPos,
        count: length,
        effect: SlideEffect(
          dotWidth: 8.0,
          dotHeight: 8.0,
          activeDotColor: Colors.green,
          dotColor: Color.fromRGBO(175, 179, 182, 1),
        ),
      );
}
