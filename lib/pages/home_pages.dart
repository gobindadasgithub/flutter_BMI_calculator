import 'package:bmi_calclulator/pages/result_pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _weightController.text = '75';
    _heightController.text = '1.7';
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Text('Welcome',style: TextStyle(fontSize: 24),),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'weight',
                  hintText: 'Enter your Weight in kilogram',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),

          ),
          SizedBox(height: 20,),
          Padding(padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'height',
                  hintText: 'Enter your Height in Meter',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),

          ),
          ElevatedButton(
            onPressed: _calculateBMI,
            child: const Text('Get your BMI'),
          )
        ],

      ),
    );
  }

  void _calculateBMI() {
    if(_weightController.text.isEmpty) {
      showMsg(context, 'Please provide a valid weight');
      return;
    }

    if(_heightController.text.isEmpty) {
      showMsg(context, 'Please provide a valid height');
      return;
    }

    if(double.parse(_weightController.text) <= 0.0) {
      showMsg(context, 'Weight must be greater then Zero');
      return;
    }

    if(double.parse(_heightController.text) <= 0.0) {
      showMsg(context, 'Height must be greater then Zero');
      return;
    }

    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text);
    final bmi = weight / (height * height);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultPage(bmi: bmi,)),
    );
  }
}

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));

