import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/NewsLayeout/NewsCubit/cubit.dart';
import 'package:flutter_app3/layout/NewsLayeout/NewsCubit/states.dart';
import 'package:flutter_app3/modules/news_app/search/search_screen.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/cubit/cubit.dart';
import '../../shard/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
       listener: (context, states) {},
       builder: (context, states) {
         var cubit = NewsCubit.get(context);
         return Scaffold(
           appBar: AppBar(
             title: Text(
               'News Application',
             ),
             actions: [
               IconButton(
                 onPressed: (){
                   navigateTo(context, Search());
                 },
                 icon:Icon(Icons.search),
               ),
               IconButton(
                 onPressed: (){
                   AppCubit().get(context).themeMode();
                 },
                 icon:Icon(Icons.dark_mode),
               ),

             ],
           ),
           body: cubit.screen[cubit.currentIndex],
           bottomNavigationBar: BottomNavigationBar(
             currentIndex: cubit.currentIndex,
             items: cubit.bottomItem,
             onTap: (index)
             {
               cubit.changeBottomNav(index);
             },
           ),
         );
       },
    );
  }
}
