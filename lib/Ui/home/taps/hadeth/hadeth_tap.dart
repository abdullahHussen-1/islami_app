import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Ui/home/taps/hadeth/hadeth_item.dart';

class HadethTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CarouselSlider.builder(
        itemBuilder: (context, index, _) {
          return HadethItem(index: index);
        },
        itemCount: 50,
        options: CarouselOptions(
            height: sizeHeight * 0.66,
            enableInfiniteScroll: true,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.2),
      ),
    );
  }
}
