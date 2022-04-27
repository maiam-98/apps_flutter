import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/shop_app/shopLayout.dart';
import 'package:flutter_app3/models/shop_model/login_model.dart';
import 'package:flutter_app3/modules/shop_app/%20shop_login/cubit/cubit.dart';
import 'package:flutter_app3/modules/shop_app/%20shop_login/cubit/state.dart';
import 'package:flutter_app3/modules/shop_app/register/register_screen.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopLogin extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state){
          if(state is ShopLoginSuccessState)
            {
              if(state.loginModel.status!)
                {
                  token = CacheHelper.getData(key: 'token');
                  CacheHelper.saveData(key: 'token', value: state.loginModel.data!.token).then((value){
                    navigateAndFinish(context, ShopLayout());
                  });
                }
              else
                {
                  showToast(text: state.loginModel.message!, state:ToastState.ERROR);
                }
            }
        },
        builder: (context, state) =>Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'login now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      defaultFormField(
                        controll: emailController,
                        textInputType: TextInputType.emailAddress,
                        label: 'Email Address',
                        massageValidation: 'email most not Empty',
                        prefix: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        onField:(value)
                        {
                          if(formKey.currentState!.validate())
                          {
                          ShopLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);}

                        },
                        controll: passwordController,
                        textInputType: TextInputType.visiblePassword,
                        label: 'Password',
                        massageValidation: 'Password most not short',
                        prefix: Icons.lock_outline,
                        suffix: ShopLoginCubit.get(context).suffix,
                        obscure: ShopLoginCubit.get(context).isPassword,
                        passwordShow: ()
                          {
                            ShopLoginCubit.get(context).changPasswordShow();
                          },

                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopLoginLoadingState,
                        builder: (BuildContext context) => defaultButton(
                          function: ()
                          {
                            if(formKey.currentState!.validate())
                            {
                              ShopLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);}
                          },
                          text: 'LOGIN',
                        ),
                        fallback:(context) => Center(child: CircularProgressIndicator()),

                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'n  have an account?',
                          ),
                          defaultTextButton(
                              function: ()
                              {
                                navigateTo(context, ShopRegisterScreen());
                              },
                              text: 'Register.'
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
