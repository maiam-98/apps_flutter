import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/shop_app/shopLayout.dart';
import 'package:flutter_app3/layout/social_app/social_Layeout.dart';
import 'package:flutter_app3/modules/shop_app/register/cubit/cubit.dart';
import 'package:flutter_app3/modules/shop_app/register/cubit/state.dart';
import 'package:flutter_app3/modules/social_app/social_login/cubit/state.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';

class SocialRegisterScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
        listener: (context, state)
        {
          if(state is SocialCreateUserSuccessState)
            {
              navigateAndFinish(
                  context,
                  SocialLayout(),
              );
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
                        'register now to connection with friend',
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
                        suffix: SocialRegisterCubit.get(context).suffix,
                        obscure: SocialRegisterCubit.get(context).isPassword,
                        passwordShow: ()
                        {
                          SocialRegisterCubit.get(context).changPasswordShow();
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
                        condition: state is! SocialRegisterLoadingState,
                        builder: (BuildContext context) => defaultButton(
                          function: ()
                          {
                            if(formKey.currentState!.validate())
                            {
                              SocialRegisterCubit.get(context).userRegister(
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
