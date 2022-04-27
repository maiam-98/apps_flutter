
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'My Application'
        ),
        actions: [
          IconButton(
            icon:Icon(
              Icons.notification_important,
            ),
            onPressed:()
            {
              print('notification alert');
            },
          ),
          IconButton(
            icon:Icon(
              Icons.access_alarm
            ),
            onPressed: ()
            {
              print(' access alert');
            },
          ),
        ],
      ),
      body: Container(
        //color: Colors.blueGrey,
        //double.infinity full size screen with width
        //height : double.infinity,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  20.0
                ),
              )
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children:
              [
                Image(
                  image: NetworkImage(
                    'https://image.shutterstock.com/image-vector/manga-eyes-looking-paper-tear-600w-1523804378.jpg'
                  ),
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
                Container(
                  color:Colors.blueGrey.withOpacity(.5),
                  width: double.infinity ,
                  //EdgeInsetsD
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    'Anime',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //scroll view
        /*child: SingleChildScrollView(
          //the default scrollDirection is Axis.vertical
          //in the column don't use scrollDirection
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Text(
                'First Text',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),

            ],
          ),
        ),*/
        //row
        /*child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              color: Colors.blueGrey,
              child: Text(
                'First Text',
                style: TextStyle(
                  fontSize: 10.0,
                  color:Colors.white,
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              child: Text(
                'second text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                ),
              ),
            ),
            Container(
              color: Colors.black26,
              child: Text(
                'third text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                ),
              ),
            ),
          ],
        ),*/
        //column
        /*       child: Column(
          //default:
          //main axis alignment : start
          //cross axis alignment : center
          //main Axis Size : max in column
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Container(
              color: Colors.black,
              child: Text(
                  'First text',
                style: TextStyle(
                  fontSize:30.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              color: Colors.yellow,
              child: Text(
                'second text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              color: Colors.black26,
              child: Text(
                'third text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),*/
      ),
    );

        }

}
