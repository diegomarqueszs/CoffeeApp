import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();
  //utilizada para simular fotos de folhas
  var images = [
    'lib/assets/images/leaf/lf1.jpeg',
    'lib/assets/images/leaf/lf2.jpeg',
    'lib/assets/images/leaf/lf3.jpeg',
    'lib/assets/images/leaf/lf4.jpeg',
    'lib/assets/images/leaf/lf5.jpeg',
    'lib/assets/images/leaf/lf6.jpeg',
    'lib/assets/images/leaf/lf7.jpeg',
    'lib/assets/images/leaf/lf8.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/bgimg.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100.0,
              ),
              const Text(
                "CoffeApp",
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                "Analyze plant health in the palm",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              const Text(
                "of your hands",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              const Text(
                "What do you want to analyze?",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 120.0,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(
                              'CamSimulated',
                              arguments: {
                                'list': getRandomImage(images),
                                'rout': 'Recomendation',
                                'title': 'Leaf',
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size.square(50),
                          ),
                          child: const Icon(
                            Icons.eco,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "Leaf",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          //flower
                          onPressed: () {
                            Get.toNamed('Analyze', arguments: "Flower");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size.square(50),
                          ),
                          child: const Icon(
                            Icons.local_florist,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "Flower",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed('Analyze', arguments: "Fruit");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size.square(50),
                          ),
                          child: const Icon(
                            Icons.apple,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "Fruit",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> getRandomImage(List<String> images) {
    images.shuffle(Random());
    List<String> randonList = [];
    randonList.add(images.first);
    return randonList;
  }
}
