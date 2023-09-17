import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'treatment.dart';

class Analyze extends StatefulWidget {
  const Analyze({super.key});

  @override
  State<Analyze> createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
  bool _classificao = false;
  bool _quantidade = false;
  bool _ambos = false;
  Color colorback = Get.arguments != "Flower"
      ? const Color(0xffBD0D0E)
      : const Color(0xff025811);

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
        padding: EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'What do you want to calculate?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: colorback,
                      borderRadius: BorderRadius.circular(6),
                    ), // cor de fundo
                    child: CheckboxListTile(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      value: _quantidade,
                      title: const Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (check) {
                        setState(() {
                          _quantidade = check!;
                          if (_ambos) {
                            _ambos = false;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16), // espaço entre os itens
                  Container(
                    decoration: BoxDecoration(
                      color: colorback,
                      borderRadius: BorderRadius.circular(6),
                    ), // cor de fundo
                    child: CheckboxListTile(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      value: _classificao,
                      title: const Text(
                        'Classification',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (check) {
                        setState(() {
                          _classificao = check!;
                          if (_ambos) {
                            _ambos = false;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16), // espaço entre os itens
                  Container(
                    decoration: BoxDecoration(
                      color: Get.arguments == "Flower"
                          ? const Color(0xffBD0D0E)
                          : const Color(0xff025811),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: CheckboxListTile(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      value: _ambos,
                      title: const Text(
                        'Both',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (check) {
                        setState(() {
                          _ambos = check!;
                          _classificao = check;
                          _quantidade = check;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: (!_classificao && !_quantidade)
                    ? Colors.grey
                    : Get.arguments == "Flower"
                        ? const Color(0xff025811)
                        : const Color(0xffBD0D0E),
                fixedSize: const Size(200, 50),
              ),
              onPressed: (!_classificao && !_quantidade)
                  ? null
                  : () {
                      Get.toNamed('Treatment', arguments: Get.arguments);
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
