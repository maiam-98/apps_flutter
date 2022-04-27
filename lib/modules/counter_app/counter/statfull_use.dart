import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/modules/counter_app/counter//cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

// ignore: must_be_immutable
class statfull_use extends StatelessWidget {
  int conter = 1;
  @override
  Widget build(BuildContext context)
  {

    return BlocProvider
      (
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state){
          if(state is CounterMinusState) {
            print('minus state ${state.counter}');
          }
          if(state is CounterPlusState) {
            print('plus state ${state.counter}');
          }
        },
        builder: (context, state)
        {
          return  Scaffold(
            appBar: AppBar(
              title: Text(
             'Math',
            ),
          ),
            body: Center(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: ()
                  {
                  CounterCubit.get(context).minus();
                  },
                  child: Text(
                    'minus',
                    style: TextStyle(
                      fontSize: 20.0,
                      color:Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  '${CounterCubit.get(context).counter}',
                  style: TextStyle(
                    fontSize: 30.0,
                    color:Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                TextButton(
                  onPressed: ()
                  {
                  CounterCubit.get(context).plus();
                  },
                  child: Text(
                    'plus',
                    style: TextStyle(
                      fontSize: 20.0,
                      color:Colors.blue,
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
        }


      ),
    );


 }
}
