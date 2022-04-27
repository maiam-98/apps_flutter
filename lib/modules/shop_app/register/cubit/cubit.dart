import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/models/shop_model/login_model.dart';
import 'package:flutter_app3/modules/shop_app/%20shop_login/cubit/state.dart';
import 'package:flutter_app3/modules/shop_app/register/cubit/state.dart';
import 'package:flutter_app3/shard/network/end_point.dart';
import 'package:flutter_app3/shard/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super (ShopRegisterInitialState());

 static ShopRegisterCubit get(context) => BlocProvider.of(context);

 late ShopLoginModel loginModel;
  void userRegister
      ({
  required String email,
  required String name,
  required String phone,
  required String password,
    String? token,
  })
  {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data:
      {
        'name' : name,
        'email' : email,
        'password' : password,
        'phone' : phone,
    },
    ).then((value){
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
  });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changPasswordShow()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopRegisterChangePasswordVisibilityState());
  }
}