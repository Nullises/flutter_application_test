import "package:flutter/material.dart";
import "package:flutter_application_test/shared/menu_bottom.dart";
import "package:flutter_application_test/shared/menu_drawer.dart";
import "package:flutter_application_test/shared/navbar.dart";

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ${(isMetric) ? 'meters' : 'inches'}';
    weightMessage =
        'Please insert your weight in ${(isMetric) ? 'kilos' : 'pounds'}';
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Navbar(
            title: 'BMI',
          ),
        ),
        bottomNavigationBar: const MenuBottom(),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ToggleButtons(
                isSelected: isSelected,
                onPressed: toggleMeasure,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Metric',
                        style: TextStyle(fontSize: fontSize),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Imperial',
                        style: TextStyle(fontSize: fontSize),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMessage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightMessage),
                ),
              ),
              ElevatedButton(
                  onPressed: findBMI,
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: fontSize),
                  )),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  result,
                  style: TextStyle(fontSize: fontSize),
                ),
              )
            ],
          ),
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isImperial = false;
      isMetric = true;
    } else {
      isImperial = true;
      isMetric = false;
    }

    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }
}
