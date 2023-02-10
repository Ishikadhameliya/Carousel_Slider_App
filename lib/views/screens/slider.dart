import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  State<screen> createState() => _screenState();
}

CarouselController carouselController = CarouselController();
int initvalue = 0;

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _widht = MediaQuery.of(context).size.width;
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("${res['name']}"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            CarouselSlider(
              carouselController: carouselController,
              items: [
                Image.network("${res['image1']}", fit: BoxFit.cover),
                Image.network("${res['image2']}", fit: BoxFit.cover),
                Image.network("${res['image3']}", fit: BoxFit.cover),
                Image.network("${res['image4']}", fit: BoxFit.cover),
                Image.network("${res['image5']}", fit: BoxFit.cover),
              ],
              options: CarouselOptions(
                  height: _height * 0.5,
                  autoPlay: true,
                  aspectRatio: 0.8,
                  enlargeCenterPage: true,
                  initialPage: initvalue,
                  onPageChanged: (val, _) {
                    setState(() {
                      initvalue = val;
                    });
                  },
                  autoPlayCurve: Curves.decelerate),
            ),
            const SizedBox(
              height: 25,
            ),

            CarouselSlider(
                carouselController: carouselController,
                items: [
                  Image.network("${res['image6']}", fit: BoxFit.cover),
                  Image.network("${res['image7']}", fit: BoxFit.cover),
                  Image.network("${res['image8']}", fit: BoxFit.cover),
                  Image.network("${res['image9']}", fit: BoxFit.cover),
                  Image.network("${res['image10']}", fit: BoxFit.cover),
                ],
                options: CarouselOptions(
                    height: _height * 0.45,
                    autoPlay: true,
                    aspectRatio: 0.8,
                    enlargeCenterPage: true,
                    initialPage: initvalue,
                    onPageChanged: (val, _) {
                      setState(() {
                        initvalue = val;
                      });
                    },
                    autoPlayCurve: Curves.decelerate)),
          ],
        ),
      ),
    );
  }
}
