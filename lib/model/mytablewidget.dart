import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'weatherScreen.dart';

class MyTabbedWidget extends StatefulWidget {
  MyTabbedWidget({Key? key, required this.colorBack}) : super(key: key);
  Color colorBack;

  @override
  _MyTabbedWidgetState createState() => _MyTabbedWidgetState();
}

class _MyTabbedWidgetState extends State<MyTabbedWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late Future<Map<String, dynamic>> weatherDataFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    weatherDataFuture =
        fetchWeatherData().then((weatherData) => weatherData.toJson());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: weatherDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final weatherDataMap = snapshot.data!;
          final temperature = weatherDataMap['temperature'];
          final weatherCondition = weatherDataMap['weatherCondition'];
          final cityName = weatherDataMap['cityName'];
          final urlImage = weatherDataMap['image'];
          final tempMax = weatherDataMap['tempMax'];
          final tempMin = weatherDataMap['tempMin'];
          final percent = weatherDataMap['percent'];
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              bottom: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Today'),
                  Tab(text: 'Tomorrow'),
                  Tab(text: 'Next Days'),
                ],
              ),
              title: const Text('Weather forecast'),
              backgroundColor: widget.colorBack,
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                // Conteúdo da aba "Hoje"
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: getToday(temperature, weatherCondition, cityName,
                        urlImage, tempMax, tempMin, percent),
                  ),
                ),
                // Conteúdo da aba "Amanhã"
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: getToday(temperature, weatherCondition, cityName,
                        urlImage, tempMax, tempMin, percent),
                  ),
                ),
                // Conteúdo da aba "Próximos dias"
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: getToday(temperature, weatherCondition, cityName,
                        urlImage, tempMax, tempMin, percent),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Column getToday(String temperature, String weatherCondition, String cityName,
      String urlImage, String tempMax, String tempMin, String percent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            cityName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Max: $tempMax',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Min: $tempMin',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    temperature,
                    style: const TextStyle(fontSize: 45),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.network(
                    urlImage,
                    width: 50,
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        '$weatherCondition: ',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Text(
                        percent,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Image(
          image: AssetImage('lib/assets/graphic/forecast.png'),
        ),
      ],
    );
  }
}
