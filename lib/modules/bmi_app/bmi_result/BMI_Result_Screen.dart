// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BMI_Result extends StatelessWidget {
  final int result;
  final int age;
  final bool isMale;
  BMI_Result({
    required this.result,
    required this.age,
    required this.isMale,
}
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left,
          ),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'BMI Result',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale ? 'Male' : 'Female'}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              'Result : $result',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              'Age : $age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
