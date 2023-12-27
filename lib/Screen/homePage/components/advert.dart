import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdvertGallery extends StatelessWidget {

  AdvertGallery({Key? key, required this.assetPaths,}) : super(key: key);
  final List<String> assetPaths;
  @override
    List<String> imgList = [
      'assets/images/ads/pic_1.jpg',
      'assets/images/ads/pic_2.png',
    ];
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0, // Set height as per your requirement
          enableInfiniteScroll: true,
          autoPlay: true,
          viewportFraction: 1.0,
        ),
        items: imgList.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

// List of image assets
const List<String> advertImages = [
  'assets/images/ads/pic_1.jpg',
  'assets/images/ads/pic_2.png',
  // Add more paths as needed
];