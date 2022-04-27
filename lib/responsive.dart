import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/adaptive_indicator.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/styles/colors.dart';

class Responsive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child:Container(
                color: Colors.teal,
                height: double.infinity,
              ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'LOGIN IN YOUR ACCOUNT...',
                    style: Theme.of(context).textTheme.headline4
                  ),
                  SizedBox(

                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Email'),
                      ),
                    ),
                  ),
                  SizedBox(

                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('password'),
                      ),
                    ),
                  ),
                  SizedBox(

                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 45.0,
                    color: defaultColor,
                    child: MaterialButton(
                        onPressed: ()
                        {},
                      child: Text(
                          'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                        ),
                      ),

                        ),
                  ),
                  SizedBox(

                    height: 10.0,
                  ),
                  Center(
                    child:AdaptiveIndicator(
                      os: getOs(),
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
