import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/models/user/user_model.dart';


class Users_Screen extends StatelessWidget {
  List<Model> user = [
    Model(
      id: 1,
      name: 'Mariam',
      phone: 123354112,
    ),
    Model(
      id: 2,
      name: 'mari',
      phone: 174195,
    ),
    Model(
      id: 3,
      name: 'watteen',
      phone: 852963,
    ),
    Model(
      id: 1,
      name: 'Mariam',
      phone: 123354112,
    ),
    Model(
      id: 2,
      name: 'mari',
      phone: 174195,
    ),
    Model(
      id: 3,
      name: 'watteen',
      phone: 852963,
    ),
    Model(
      id: 1,
      name: 'Mariam',
      phone: 123354112,
    ),
    Model(
      id: 2,
      name: 'mari',
      phone: 174195,
    ),
    Model(
      id: 3,
      name: 'watteen',
      phone: 852963,
    ),
    Model(
      id: 1,
      name: 'Mariam',
      phone: 123354112,
    ),
    Model(
      id: 2,
      name: 'mari',
      phone: 174195,
    ),
    Model(
      id: 3,
      name: 'watteen',
      phone: 852963,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usres',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            itemBuilder: (context,index)=>buildUsers(user[index]),
            separatorBuilder: (context,index)=>Container(
              width: 5.0,
              height: 5.0,
              color: Colors.grey[200],
            ),
            itemCount: user.length,
        )
      ),
    );
  }
  //1.build item
  //2.build list
  //3.add item to list

  Widget buildUsers(Model users) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          child: Text(
            '${users.id}',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${users.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              '${users.phone}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),

      ],
    ),
  );
}
