// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class testlogin extends StatelessWidget {
  var controllemail = TextEditingController();
  var controllpassword = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children:
              [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  height: 20.0
              ),
              TextFormField(
                controller: controllemail,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value)
                {
                  print(value);
                },
                  onChanged:(value)
                  {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email,),
                    border: OutlineInputBorder(),
                  ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: controllpassword,
                keyboardType: TextInputType.visiblePassword,
                onFieldSubmitted: (value)
                {
                  print(value);
                },
                onChanged: (value)
                {
                  print(value);
                },
                obscureText:true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: ()
                  {
                    print(controllemail);
                    print(controllpassword);

                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'n have an account?',
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text(
                        'Register Now',
                      ),
                  ),
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
