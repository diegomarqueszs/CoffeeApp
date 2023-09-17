import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class Recomendation extends StatefulWidget {
  const Recomendation({Key? key}) : super(key: key);

  @override
  _RecomendationState createState() => _RecomendationState();
}

class _RecomendationState extends State<Recomendation> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

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
      body: _isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Get.arguments != "Flower" ? Colors.green : Colors.red,
                  ),
                )),
                const SizedBox(height: 10),
                const Text(
                  'calculating recommendations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: getSlideFruit(Get.arguments['list']),
                ),
                const Divider(
                  thickness: 35,
                  color: Color(0xffBD0D0E),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Recomendation",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        spacing:
                            10, // espaçamento entre os itens na mesma linha
                        runSpacing: 20, // espaçamento entre as linhas
                        children: [
                          getExpansionTitle("Field management recommendation",
                              "For optimal growth and yield, coffee plants require regular fertilization and pruning.\n\nWe recommend applying nitrogen-rich fertilizers every 3-4 months, as well as removing any diseased or damaged branches to promote healthy growth."),
                          getExpansionTitle(
                              "Product application recommendation",
                              "To control pests and diseases, we recommend applying a foliar spray containing a combination of fungicides and insecticides every 2-3 weeks, especially during the rainy season."),
                          getExpansionTitle("Flowering forecast",
                              "Based on current weather patterns and plant growth, we expect coffee plants to start flowering in approximately 3-4 weeks."),
                          getExpansionTitle("Harvest forecast",
                              "Based on current plant growth and historical yield data, we anticipate a bountiful harvest in approximately 2 months."),
                          getExpansionTitle("Beverage quality forecast",
                              "Based on plant health and environmental factors, we predict that the coffee produced this season will be of high quality, with a rich aroma and flavor notes of chocolate and citrus."),
                          getExpansionTitle("Sell your coffee",
                              "To maximize profits, we recommend selling your coffee beans directly to roasters or specialty coffee shops, where it can command a higher price due to its quality.\n\nYou may also consider participating in coffee auctions or listing your beans on online marketplaces."),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  ImageSlideshow getSlideFruit(List<String> images) {
    List<Widget> imageList = images.map((image) {
      return Image.asset(
        image,
        fit: BoxFit.cover,
      );
    }).toList();

    return ImageSlideshow(
      height: 330,
      indicatorColor: Colors.blue,
      onPageChanged: (value) {
        debugPrint('Page changed: $value');
      },
      isLoop: false,
      children: imageList,
    );
  }

  ExpansionTile getExpansionTitle(String title, String info) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );
    return ExpansionTile(
      shape: roundedRectangleBorder,
      collapsedBackgroundColor: Colors.grey[200],
      collapsedShape: roundedRectangleBorder,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            info,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
