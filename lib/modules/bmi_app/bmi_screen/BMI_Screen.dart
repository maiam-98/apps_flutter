import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bmi_result/BMI_Result_Screen.dart';

class BMI_Screen extends StatefulWidget {
  @override
  _BMI_ScreenState createState() => _BMI_ScreenState();
}

class _BMI_ScreenState extends State<BMI_Screen> {
  bool isMale = true;
  double height = 120;
  int age = 20;
  double width = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        children:
        [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:
                  [
                    Expanded(
                      // click
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMale = true ;
                          });
                        },
                        child: Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0,),
                            color:isMale ? Colors.blue : Colors.grey[300]  ,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              Image(
                                image: AssetImage(
                                  'Assets/imags/male.png',
                                ),
                                width: 80.0,
                                height: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMale = false ;
                          });
                        },
                        child: Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0,),
                            color:!isMale ? Colors.blue : Colors.grey[300]  ,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              Image(
                                image: AssetImage(
                                  'Assets/imags/female.png',
                                ),
                                width: 80.0,
                                height: 80.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
          ),
          Expanded(
              child:Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0,),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40.0,
                            ),
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        max: 220.0,
                        min: 80.0,
                        onChanged:(value)
                        {
                          setState(() {
                            height=value ;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:
                [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color:Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                           children:
                           [
                             FloatingActionButton(
                                 onPressed:()
                                 {
                                   setState(() {
                                     age--;
                                   });
                                 },
                               heroTag: 'age-',
                               mini: true,
                               child: Icon(
                                 Icons.remove,
                               ),
                             ),
                             FloatingActionButton(
                                 onPressed:()
                                 {
                                   setState(() {
                                     age ++;
                                   });
                                 },
                               heroTag: 'age+',
                               mini: true,
                               child: Icon(
                                 Icons.add,
                               ),
                             ),
                           ],
                         ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color:Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          Text(
                            'WIDTH',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${width}',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                           children:
                           [
                             FloatingActionButton(
                                 onPressed:()
                                 {
                                   setState(() {
                                     width--;
                                   });
                                 },
                               heroTag: 'width-',
                               mini: true,
                               child: Icon(
                                 Icons.remove,
                               ),
                             ),
                             FloatingActionButton(
                                 onPressed:()
                                 {
                                   setState(() {
                                     width++;
                                   });
                                 },
                               heroTag: 'width+',
                               mini: true,
                               child: Icon(
                                 Icons.add,
                               ),
                             ),
                           ],
                         ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              height: 50.0,
              onPressed:()
              {
                double result = width / pow(height / 100 ,2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>BMI_Result(
                        result: result.round(),
                        age: age,
                        isMale: isMale,
                      ),
                  ),
                );

              },
            child: Text(
              'Calculator',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
