import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/shop_app/shopLayout.dart';
import 'package:flutter_app3/modules/shop_app/register/cubit/cubit.dart';
import 'package:flutter_app3/modules/shop_app/register/cubit/state.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state){
          if(state is ShopRegisterSuccessState)
          {
            if(state.loginModel.status!)
            {
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
                        'REGISTER',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'register now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      defaultFormField(
                        controll: nameController,
                        textInputType: TextInputType.name,
                        label: 'User Name',
                        massageValidation: 'name most not Empty',
                        prefix: Icons.person,
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
                        controll: passwordController,
                        textInputType: TextInputType.visiblePassword,
                        label: 'Password',
                        massageValidation: 'Password most not short',
                        prefix: Icons.lock_outline,
                        suffix: ShopRegisterCubit.get(context).suffix,
                        obscure: ShopRegisterCubit.get(context).isPassword,
                        passwordShow: ()
                        {
                          ShopRegisterCubit.get(context).changPasswordShow();
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      defaultFormField(
                        controll: phoneController,
                        textInputType: TextInputType.phone,
                        label: 'Number phone',
                        massageValidation: 'phone most not Empty',
                        prefix: Icons.phone,
                      ),

                      SizedBox(
                        height: 15.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopRegisterLoadingState,
                        builder: (BuildContext context) => defaultButton(
                          function: ()
                          {
                            if(formKey.currentState!.validate())
                            {
                              ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  );}
                          },
                          text: 'REGISTER',
                        ),
                        fallback:(context) => Center(child: CircularProgressIndicator()),

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
