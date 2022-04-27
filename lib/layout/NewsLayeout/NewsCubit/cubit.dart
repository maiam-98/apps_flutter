import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/NewsLayeout/NewsCubit/states.dart';
import 'package:flutter_app3/modules/news_app/business/business.dart';
import 'package:flutter_app3/modules/news_app/science/science.dart';
import 'package:flutter_app3/modules/news_app/sports/sports.dart';
import '../../../shard/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0 ;
  List<BottomNavigationBarItem> bottomItem =
  [
    BottomNavigationBarItem(
      icon:Icon(
          Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon:Icon(
          Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon:Icon(
          Icons.sports,
      ),
      label: 'Sports',
    ),
  ];
  List<Widget> screen =
      [
        Business(),
        Science(),
        Sports(),

      ];
   void changeBottomNav(int index){
     currentIndex = index;
     if (index == 1)
      getScience();
     if (index == 2)
     getSports();
    emit(NewsChangeBottomNav());
  }

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];

   void getBusiness() {
     emit(NewsLoadingGetBusinessState());
       DioHelper.getData(
           url: 'v2/top-headlines',
           query: {
             'country' : 'eg',
             'category' : 'business',
             'apiKey' : '04903369ec154668b19dda250fe65134',
           }
           ).then((value)
       {
         business = value.data['articles'];
         print(business[0]['title']);
         emit(NewsSuccessGetBusinessState());
       }).catchError((error){
         print(error.toString());
         emit(NewsErrorGetBusinessState(error.toString()));
       });


   }
   void getScience() {
     emit(NewsLoadingGetScienceState());
     if (science.length == 0){
       DioHelper.getData(
           url: 'v2/top-headlines',
           query: {
             'country' : 'eg',
             'category' : 'science',
             'apiKey' : '04903369ec154668b19dda250fe65134',
           }
       ).then((value)
       {
         science = value.data['articles'];
         print(science[0]['title']);
         emit(NewsSuccessGetScienceState());
       }).catchError((error){
         emit(NewsErrorGetScienceState(error.toString()));
       });
     }else{
       emit(NewsSuccessGetScienceState());
     }
   }
   void getSports() {
     emit(NewsLoadingGetSportsState());
     if(sports.length == 0) {
       DioHelper.getData(
           url: 'v2/top-headlines',
           query: {
             'country': 'eg',
             'category': 'sports',
             'apiKey': '04903369ec154668b19dda250fe65134',
           }
       ).then((value) {
         sports = value.data['articles'];
         print(sports[0]['title']);
         emit(NewsSuccessGetSportsState());
       }).catchError((error) {
         print(error.toString());
         emit(NewsErrorGetSportsState(error.toString()));
       });
     }else{
       emit(NewsSuccessGetSportsState());
     }

   }
  List<dynamic> search = [];
   void getSearch(value) {
     emit(NewsLoadingGetSearchState());

       DioHelper.getData(
           url: 'v2/everything',
           query: {
             'q': '$value',
             'apiKey': '04903369ec154668b19dda250fe65134',
           }
       ).then((value) {
         search = value.data['articles'];
         print(search[0]['title']);
         emit(NewsSuccessGetSearchState());
       }).catchError((error) {
         emit(NewsErrorGetSearchState(error.toString()));
       });
       emit(NewsSuccessGetSearchState());


   }

}
