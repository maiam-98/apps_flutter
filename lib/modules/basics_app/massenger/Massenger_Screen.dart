import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Massinger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        //the color of the shadow below the app bar
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'
              ),
              radius: 20.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueGrey,
            ), onPressed: () {  },
          ),
          SizedBox(
            height: 20.0,
          ),
          IconButton(
            icon: CircleAvatar(
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueGrey,
            ), onPressed: () {  },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                      color: Colors.blueGrey,
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        Text(
                          'Search',
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 15.0,
                ),
                //the old fashion
                /*SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                      width: 60.0,
                        child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:
                            [
                              CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'
                              ),
                              radius:30.0 ,
                            ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  end: 3.0,
                                  bottom: 3.0,
                                ),
                                child: CircleAvatar(
                                  radius: 7.0,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 15.0,
                            ),
                            child: Text(
                              'Mari Alodini Mari Alodini',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
              ],
    ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children:
                              [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'
                                  ),
                                  radius:30.0 ,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 3.0,
                                    bottom: 3.0,
                                  ),
                                  child: CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 15.0,
                              ),
                              child: Text(
                                'Mari Alodini Mari Alodini',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children:
                              [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'
                                  ),
                                  radius:30.0 ,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 3.0,
                                    bottom: 3.0,
                                  ),
                                  child: CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 15.0,
                              ),
                              child: Text(
                                'Mari Alodini Mari Alodini',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children:
                              [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'
                                  ),
                                  radius:30.0 ,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 3.0,
                                    bottom: 3.0,
                                  ),
                                  child: CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 15.0,
                              ),
                              child: Text(
                                'Mari Alodini Mari Alodini',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children:
                              [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'
                                  ),
                                  radius:30.0 ,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 3.0,
                                    bottom: 3.0,
                                  ),
                                  child: CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 15.0,
                              ),
                              child: Text(
                                'Mari Alodini Mari Alodini',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children:
                              [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'
                                  ),
                                  radius:30.0 ,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    end: 3.0,
                                    bottom: 3.0,
                                  ),
                                  child: CircleAvatar(
                                    radius: 7.0,
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: 15.0,
                              ),
                              child: Text(
                                'Mari Alodini Mari Alodini',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),*/
                /*SizedBox(
                  height: 20.0,
                ),*/
                /*Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        Row(
                          children:
                          [

                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
                              ),
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mair alodini Mari alodini Maria alodini',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Hallow I am is Mari alodini mmmmmmmmmmmmmmmmmmmmm',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 1.0,),
                                        child: CircleAvatar(
                                          radius: 2.0,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '02.00pm',
                                        style: TextStyle(
                                           color:Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),



                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children:
                          [

                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
                              ),
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mair alodini Mari alodini Maria alodini',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Hallow I am is Mari alodini mmmmmmmmmmmm',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 1.0,),
                                        child: CircleAvatar(
                                          radius: 2.0,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '02.00pm',
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),



                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children:
                          [

                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
                              ),
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mair alodini Mari alodini Maria alodini',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Hallow I am is Mari alodini mmmmmmmmmmmm',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 1.0,),
                                        child: CircleAvatar(
                                          radius: 2.0,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '02.00pm',
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),



                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children:
                          [

                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
                              ),
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mair alodini Mari alodini Maria alodini',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Hallow I am is Mari alodini mmmmmmmmmmmm',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 1.0,),
                                        child: CircleAvatar(
                                          radius: 2.0,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '02.00pm',
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),



                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children:
                          [

                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
                              ),
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mair alodini Mari alodini Maria alodini',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Hallow I am is Mari alodini mmmmmmmmmmmm',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 1.0,),
                                        child: CircleAvatar(
                                          radius: 2.0,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '02.00pm',
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),



                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children:
                          [

                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
                              ),
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mair alodini Mari alodini Maria alodini',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Hallow I am is Mari alodini mmmmmmmmmmmm',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 1.0,),
                                        child: CircleAvatar(
                                          radius: 2.0,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '02.00pm',
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),



                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children:
                          [

                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
                              ),
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mair alodini Mari alodini Maria alodini',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Hallow I am is Mari alodini mmmmmmmmmmmm',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 1.0,),
                                        child: CircleAvatar(
                                          radius: 2.0,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '02.00pm',
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),



                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children:
                          [

                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
                              ),
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mair alodini Mari alodini Maria alodini',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Hallow I am is Mari alodini mmmmmmmmmmmm',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 1.0,),
                                        child: CircleAvatar(
                                          radius: 2.0,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '02.00pm',
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),



                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),*/
                Container(
                  height: 100.0,
                  // listView يعمل تكرار ويعدل الفراغات و بقية الاشياء
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index) => buildStoryItem(),
                      separatorBuilder: (context,index) => SizedBox(
                        width: 20.0,
                      ),
                    itemCount:5,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index) => buildChatItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.0,
                    ) ,
                    itemCount:15,
                ),

              ],
            ),
          ),
      ),
    );
  }
  // 1. build item
  // 2. build list
  // 3. add item to list
 // arrow function
  Widget buildChatItem() => Row(
    children:
    [

      CircleAvatar(
        backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
        ),
        radius: 30.0,
      ),
      SizedBox(
        width: 15.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mair alodini Mari alodini Maria alodini',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hallow I am is Mari alodini mmmmmmmmmmmmmmmmmmmmm',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0,),
                  child: CircleAvatar(
                    radius: 2.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                Text(
                  '02.00pm',
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 13.0,
                  ),
                ),



              ],
            ),
          ],
        ),
      ),

    ],
  );
  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:
          [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'
              ),
              radius:30.0 ,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                end: 3.0,
                bottom: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 15.0,
          ),
          child: Text(
            'Mari Alodini Mari Alodini',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
