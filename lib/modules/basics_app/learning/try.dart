
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class testloginn extends StatelessWidget {
  @override
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(backgroundColor: Colors.teal,),
    body: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Center(
    child: SingleChildScrollView(
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
    TextFormField(
    controller: emailController ,
    keyboardType: TextInputType.emailAddress,
    onFieldSubmitted: (value)
    {
    print(value);
    },
    onChanged: (value)
    {
    print(value);
    },
    decoration: InputDecoration(
    //hintText: 'Email Address',
    labelText: 'Email Address',
    prefixIcon: Icon(
    Icons.email,
    ),
    //border: InputBorder.none,
    border: OutlineInputBorder(),

    ),
    ),
    SizedBox(
    height: 20.0,
    ),
    TextFormField(
    controller: passwordController,
    keyboardType: TextInputType.visiblePassword,
    //scur the test
    obscureText: true,
    onFieldSubmitted: (value)
    {
    print(value);
    },
    onChanged: (value)
    {
    print(value);
    },
    decoration: InputDecoration(
    labelText: 'password',
    prefixIcon: Icon(
    Icons.lock,
    ),
    suffixIcon: Icon(
    Icons.remove_red_eye,
    ),
    //border: InputBorder.none,
    border: OutlineInputBorder(),

    ),
    ),
    SizedBox(
    height: 20.0,
    ),
    Container(
    width: double.infinity,
    color: Colors.teal,
    child: MaterialButton(
    onPressed: ()
    {
    print(emailController);
    print(passwordController);

    },
    child: Text(
    'LOGIN',
    style: TextStyle(
    color: Colors.white,
    ),
    ),
    ),
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
    );
    }
    }




