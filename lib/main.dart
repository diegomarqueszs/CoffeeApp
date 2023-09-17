import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/analyze.dart';
import 'pages/cam_simulated.dart';
import 'pages/graphic.dart';
import 'pages/home.dart';
import 'pages/recomendation.dart';
import 'pages/treatment.dart';
import 'model/weatherScreen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Home(),
    getPages: [
      GetPage(name: "/Home", page: () => const Home()),
      GetPage(name: "/Analyze", page: () => const Analyze()),
      GetPage(name: "/Treatment", page: () => const Treatment()),
      GetPage(name: "/Graphic", page: () => const Graphic()),
      GetPage(name: "/CamSimulated", page: () => const CamSimulated()),
      GetPage(name: "/Recomendation", page: () => const Recomendation()),
    ],
  ));
}
