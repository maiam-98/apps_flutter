import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/models/shop_model/login_model.dart';
import 'package:flutter_app3/models/social_model/social_user_model.dart';
import 'package:flutter_app3/modules/shop_app/%20shop_login/cubit/state.dart';
import 'package:flutter_app3/modules/shop_app/register/cubit/state.dart';
import 'package:flutter_app3/modules/social_app/social_register/cubit/state.dart';
import 'package:flutter_app3/shard/network/end_point.dart';
import 'package:flutter_app3/shard/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit() : super (SocialRegisterInitialState());

 static SocialRegisterCubit get(context) => BlocProvider.of(context);


  void userRegister
      ({
  required String email,
  required String name,
  required String phone,
  required String password,
  })
  {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value)
    {
      print(value.user!.uid);
      createUser(
          email: email,
          name: name,
          phone: phone,
          uId: value.user!.uid,
      );
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(SocialRegisterErrorState(error.toString()));
    });
  }


  void createUser({
    required String email,
    required String name,
    required String phone,
    required String uId,
    isEmailVerified : false,
})
  {
    SocialUserModel model = SocialUserModel(
      uId: uId,
      email: email,
      name: name,
      image:'https://as2.ftcdn.net/v2/jpg/02/17/34/67/1000_F_217346782_7XpCTt8bLNJqvVAaDZJwvZjm0epQmj6j.jpg',
      cover:'https://as2.ftcdn.net/v2/jpg/02/17/34/67/1000_F_217346782_7XpCTt8bLNJqvVAaDZJwvZjm0epQmj6j.jpg',
      bio: 'write you bio ...',
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
          emit(SocialCreateUserSuccessState());
    })
        .catchError((error){
          print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changPasswordShow()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordVisibilityState());
  }
}