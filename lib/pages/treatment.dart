import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Treatment extends StatefulWidget {
  const Treatment({super.key});

  @override
  State<Treatment> createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
  final TextEditingController treatmentController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController photosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.arguments == "Flower"
            ? const Color(0xffBD0D0E)
            : const Color(0xff025811),
        title: Text(
          "Analyze ${Get.arguments}",
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Amount of treatments',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the amount of treatments',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Amount of rating',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter the amount of rating',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Amount of photos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter the amount of photos',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                  ),
                ),
              ],
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
                backgroundColor: Get.arguments == "Flower"
                    ? const Color(0xff025811)
                    : const Color(0xffBD0D0E),
                fixedSize: const Size(200, 50),
              ),
              onPressed: () {
                Get.toNamed(
                  'CamSimulated',
                  arguments: {
                    'list': [
                      'lib/assets/images/fruit/1.jpeg',
                      'lib/assets/images/fruit/2.jpeg',
                      'lib/assets/images/fruit/3.jpeg',
                      'lib/assets/images/fruit/4.jpeg',
                    ],
                    'rout': 'Graphic',
                    'title': Get.arguments,
                  },
                );
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
}
