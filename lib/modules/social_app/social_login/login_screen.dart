import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/social_app/social_Layeout.dart';
import 'package:flutter_app3/modules/social_app/social_register/register_screen.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';

class SocialLogin extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state)
        {
          if(state is SocialLoginErrorState)
            {
              showToast(text: state.error, state: ToastState.ERROR);
            }

          if(state is SocialLoginSuccessState)
          {
            CacheHelper.saveData(
              key: 'uid',
              value: state.uid,
            ).then((value){
              navigateAndFinish(context, SocialLayout());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                          'login now to connection with friend',
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
                            if(formKey.currentState!.validate()) {
/*
                              SocialLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
*/
                            }

                          },
                          controll: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          label: 'Password',
                          massageValidation: 'Password most not short',
                          prefix: Icons.lock_outline,
                          suffix: SocialLoginCubit.get(context).suffix,
                          obscure: SocialLoginCubit.get(context).isPassword,
                          passwordShow: ()
                          {
                            SocialLoginCubit.get(context).changPasswordShow();
                          },

                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (BuildContext context) => defaultButton(
                            function: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                  SocialLoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
                              }
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
                                  navigateTo(context, SocialRegisterScreen());
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
          );
        },
      ),
    );
  }
}
