import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:plant_scan/model/mytablewidget.dart';

class Graphic extends StatefulWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  State<Graphic> createState() => _GraphicState();
}

class _GraphicState extends State<Graphic> {
  Color colorBack = Get.arguments['title'] == "Flower"
      ? const Color(0xffBD0D0E)
      : const Color(0xff025811);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.arguments['title'] == "Flower"
            ? const Color(0xffBD0D0E)
            : const Color(0xff025811),
        title: Text(
          "Analyze ${Get.arguments['title']}",
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed("Home");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //getDivider(Get.arguments["title"], Get.arguments["subtitle"]),
            getDivider(Get.arguments['title'], "Ripeness and Unripeness"),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: getSlideGraphic(),
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height * 0.6, // limite de altura
              child: MyTabbedWidget(colorBack: colorBack),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Get.arguments['title'] == "Flower"
                    ? const Color(0xff025811)
                    : const Color(0xffBD0D0E),
                fixedSize: const Size(200, 50),
              ),
              onPressed: () {
                Get.toNamed('Recomendation', arguments: Get.arguments);
              },
              child: const Text(
                'Proceed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDivider(String title, String subtitle) {
    return Stack(
      children: [
        Container(
          height: 75,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: Get.arguments['title'] != "Flower"
                  ? [
                      const Color(0xFFFF0000),
                      const Color(0xFFAE0303)
                    ] // red gradient
                  : [
                      const Color(0xff025821),
                      const Color(0xFF02390B)
                    ], // green gradient
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "Graphics $title",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  ImageSlideshow getSlideGraphic() {
    return ImageSlideshow(
      height: 230,
      indicatorColor: Colors.blue,
      onPageChanged: (value) {
        debugPrint('Page changed: $value');
      },
      isLoop: false,
      children: [
        Image.asset(
          'lib/assets/graphic/graphics1.jpeg',
          fit: BoxFit.cover,
        ),
        Image.asset(
          'lib/assets/graphic/graphics2.jpeg',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
