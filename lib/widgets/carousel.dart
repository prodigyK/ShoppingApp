import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  var images = [
    "assets/images/carousel1.png",
    "assets/images/carousel2.jpeg",
    "assets/images/carousel3.jpg",
    "assets/images/carousel4.png",
  ];
  CarouselController _controller = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('controller: ${_controller.ready}');
    return Column(
      children: [
        Container(
          child: CarouselSlider(
            carouselController: _controller,
            items: [
              buildImageContainer(image: images[0]),
              buildImageContainer(image: images[1]),
              buildImageContainer(image: images[2]),
              buildImageContainer(image: images[3]),
            ],
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Container(
          height: 30,
          width: double.infinity,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: images.map((image) {
                int index = images.indexOf(image);
                return Container(
                  width: 12,
                  height: 12,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black87),
                    color: index == currentIndex ? Colors.white : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Container buildImageContainer({required String image}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: ExactAssetImage(image)),
      ),
    );
  }
}
