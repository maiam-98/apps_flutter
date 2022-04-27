import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/shard/components/components.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController =TextEditingController();

  var passwordController =TextEditingController();

  var formKey = GlobalKey<FormState>();

  var isPassword = true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formKey,
              child: Column(

                //crossAxisAlignment: CrossAxisAlignment.start,
               children:
               [
                 Text(
                   'Login',
                   style: TextStyle(
                     fontSize: 40.0,
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 SizedBox(
                   height: 30.0,
                 ),
                 defaultFormField(
                   controll: emailController,
                   label: 'email address',
                   prefix: Icons.email,
                   textInputType: TextInputType.emailAddress,
                   massageValidation: 'email is most not empty',

                 ),
                 SizedBox(
                   height: 20.0,
                 ),
                 defaultFormField(
                   controll:passwordController,
                   textInputType: TextInputType.visiblePassword,
                     label:'password',
                   massageValidation: 'password is must not empty',
                     prefix:Icons.lock,
                     suffix: isPassword ? Icons.visibility : Icons.visibility_off ,
                     passwordShow: ()
                   {
                     setState(() {
                       isPassword = !isPassword;
                     });
                   },
                     obscure: isPassword,
                 ),
                 SizedBox(
                   height: 20.0,
                 ),
                 defaultButton(
                     function: ()
                     {
                       if(formKey.currentState!.validate())
                         {
                           print(emailController.text);
                           print(passwordController.text);
                         }
                     },
                     text: 'login',

                 ),

                 SizedBox(
                   height: 20.0,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Don\'t have an account?',
                     ),
                    TextButton(
                      onPressed: (){},
                    child:Text('Register Now'),
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
  }
}
