import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app3/layout/NewsLayeout/NewsCubit/cubit.dart';
import 'package:flutter_app3/layout/NewsLayeout/NewsCubit/states.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return articleBuilderList(list);
      }
    );
  }
}