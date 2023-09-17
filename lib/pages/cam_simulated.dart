import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
* Simulates a camera that captures images to be sent for analysis
*/

class CamSimulated extends StatefulWidget {
  const CamSimulated({super.key});

  @override
  State<CamSimulated> createState() => _CamSimulatedState();
}

class _CamSimulatedState extends State<CamSimulated> {
  final List<String> _images = Get.arguments['list'];
  final String _rout = Get.arguments['rout'];
  int _currentIndex = 0;
  int _cont = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("$_cont/${_images.length}"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
              width: 0.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.5),
                ),
                child: IconButton(
                  onPressed: () {
                    print(_cont);
                    if (_cont >= (_images.length - 1)) {
                      Get.toNamed('$_rout', arguments: {
                        'title': Get.arguments['title'],
                        'list': Get.arguments['list'],
                      });
                    } else {
                      setState(() {
                        _currentIndex = (_currentIndex + 1) % _images.length;
                        _cont++;
                      });
                    }
                  },
                  icon: const Icon(Icons.camera_alt),
                  color: Colors.black,
                  splashRadius: 30,
                  tooltip: 'Take a picture',
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                image: DecorationImage(
                  image: AssetImage(_images[_currentIndex]),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  kBottomNavigationBarHeight -
                  80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 0.0,
                ),
                image: DecorationImage(
                  image: AssetImage(_images[_currentIndex]),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.0),
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
