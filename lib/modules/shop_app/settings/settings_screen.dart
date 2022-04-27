import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/modules/shop_app/cubit/cubit.dart';
import 'package:flutter_app3/modules/shop_app/cubit/state.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
    listener: (context, state) {},
    builder: (context, state)
    {
      var  model = ShopCubit.get(context).userGetData;

      nameController.text= model.data?.name??'';
      emailController.text = model.data?.email??'';
      phoneController.text = model.data?.phone??'';

      return ConditionalBuilder(
        condition: ShopCubit.get(context).userGetData != null,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                if(state is ShopLoadingUpdateUserState)
                  LinearProgressIndicator(),
                SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controll: nameController,
                  textInputType: TextInputType.name,
                  label: 'Name',
                  massageValidation: "name is most not Empty",
                  prefix: Icons.person,
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controll: emailController,
                  textInputType: TextInputType.emailAddress,
                  label: 'Email Address',
                  massageValidation: "email is most not Empty",
                  prefix: Icons.email,
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultFormField(
                  controll: phoneController,
                  textInputType: TextInputType.phone,
                  label: 'Phone',
                  massageValidation: "Number Phone is most not Empty",
                  prefix: Icons.phone,
                ),
                SizedBox(
                  height: 15.0,
                ),
                defaultButton(
                    function: ()
                    {

                      if(formKey.currentState!.validate()) {
                        ShopCubit.get(context).updateUserModel(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text);
                      };
                    },
                    text: 'update'),
                SizedBox(
                  height: 15.0,
                ),
                defaultButton(
                    function: ()
                    {
                      singOut(context);
                    },
                    text: 'logout'),

              ],
            ),
          ),

        ),
        fallback: (context) => Container(child: CircularProgressIndicator()),
      );
    },
    );
  }
}
