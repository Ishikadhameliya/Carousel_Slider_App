import 'package:carousel_slider_app/res/globals.dart';
import 'package:carousel_slider_app/views/screens/slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const home(),
        'slider': (context) => const screen(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image You Like",
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: Globals.all_image.length,
          itemBuilder: (context, i) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Stack(
                      alignment: const Alignment(-0.9, 1),
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pushNamed('slider',
                                  arguments: Globals.all_image[i]);
                            });
                          },
                          child:
                              Image.network("${Globals.all_image[i]['image']}"),
                        ),
                        Text(
                          "${Globals.all_image[i]['name']}",
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),),
    );
  }
}
