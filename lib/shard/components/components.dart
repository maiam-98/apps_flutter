import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app3/modules/news_app/web_view/web_view_screen.dart';
import 'package:flutter_app3/shard/cubit/cubit.dart';
import 'package:flutter_app3/shard/styles/colors.dart';
import 'package:flutter_app3/shard/styles/icon_broken.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget defaultButton ({
  double width = double.infinity,
  Color background = defaultColor,
  required Function function,
  required String text ,
  bool isUpperCase =true,
}) =>
Container(
  width: width,
  color: background,
  child: MaterialButton(
    onPressed:(){
      function();
    },
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget defaultTextButton({
  required Function function,
  required String text,
}
    ) => TextButton(
          onPressed: (){
            function();
            },
          child: Text(text.toUpperCase()),
);

Widget defaultFormField({
  required TextEditingController controll,
  required TextInputType textInputType,
  required String label ,
  required String massageValidation,
  required IconData prefix,
  IconData? suffix,
  Function? onField ,
  Function? onTap ,
  Function? onChang,
  bool obscure = false,
  Function? passwordShow,
})=>TextFormField(
  obscureText: obscure,
  controller: controll,
  keyboardType: textInputType,
  onFieldSubmitted:(s)
  {
    onField!(s);
    },
  onChanged: (s)
  {
    onChang!(s);
    },
  onTap: ()
  {
    onTap!();
    },
  validator: (value){
    if(value!.isEmpty)
      {
        return massageValidation;
      }
    return null;
  },
  decoration: InputDecoration(
    //hintText: 'Email Address',
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
      suffixIcon: IconButton(
          icon: Icon
            (
            suffix,
          ),
        onPressed: (){passwordShow!();},
      ),
    //border: InputBorder.none,
    border: OutlineInputBorder(),

  ),
);

Widget buildTaskItem(Map model, context) => Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children:
      [
        CircleAvatar(
        radius: 40.0,
        child: Text(
            '${model['time']}'
        ),
      ),
        SizedBox(
        width: 15.0,
      ),
        Expanded(child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Text(
            '${model['title']}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${model['date']}',
            style: TextStyle(
                color: Colors.grey
            ),
          ),

        ],
      )),
        SizedBox(
        width: 15.0,
      ),
        IconButton(
          onPressed:()
          {

            AppCubit().get(context).updateData
              (
                status: 'done',
                id: model['id']
            );
          },
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
          )
      ),
        IconButton(
          onPressed:()
          {
            AppCubit().get(context).updateData(
              status: 'archive',
              id: model['id'],
            );
          },
          icon: Icon(
            Icons.archive,
            color: Colors.black38,
          )
      ),
      ],
      ),),
    onDismissed: (direction)
   {
     AppCubit().get(context).deleteData(id: model['id']);
   },
);

Widget tasksBuilder ({
  required List<Map> tasks,
}) => Center(
      child:ConditionalBuilder(
        condition: tasks.length > 0,
        builder: (context) => ListView.separated(
          itemBuilder: (context,index) => buildTaskItem(tasks[index], context ),
          separatorBuilder: (context,index)=> separator(),
          itemCount: tasks.length,
    ),
        fallback:(context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          Icon
          (
          Icons.menu,
          color: Colors.grey,
          size: 100.0,
        ),
          Text
          (
          'No Tasks Yet, Please Add Some Tasks.',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ],
    ) ,
  ),
);

Widget separator() => Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 15.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color:Colors.grey[300],
  ),
);
var containerKey = GlobalKey();
Widget buildArticlesItem(articles, context) => InkWell
  (
onTap: (){
    navigateTo(context, WebViewScreen(articles['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),


    child: Row(

      children:

      [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0,),

            image: DecorationImage(
              image:
              ('${articles['urlToImage']}' != null) ? NetworkImage('${articles['urlToImage']}')
              as ImageProvider:AssetImage(
                'Assets/imags/male.png',
              ),

              fit: BoxFit.cover,

            ),





          ),

        ),

        SizedBox(

          width: 15.0,

        ),

        Expanded(

          child: Container(

            width: 120.0,

            height: 120.0,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                    '${articles['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                  ),

                ),

                Text(

                  '${articles['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

Widget articleBuilderList(list,{isSearch = false}) => ConditionalBuilder(
  condition:list.length > 0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context, index) => buildArticlesItem(list[index], context) ,
    separatorBuilder: (context, index) => separator(),
    itemCount: 10,
  ),
  fallback:(context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
);

Widget defaultAppBar({
  required BuildContext context,
  String? text,
  List<Widget>? action,
}) => AppBar(
  leading: IconButton(
    icon: Icon(
      IconBroken.Arrow___Left_2,
    ),
    onPressed: ()
    {
      Navigator.pop(context);
    },
  ),
  titleSpacing: 0.0,
  title: Text(
    text??'',
  ),
  actions: action,
);

void navigateTo (context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=>widget,
  ),
);

void navigateAndFinish (context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context)=>widget,
  ),
    (Route<dynamic> route) => false,
);

void showToast({
  required String text,
  required ToastState state,

}) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastState{SUCCESS, ERROR, WARNING}

Color chooseToastColor (ToastState state){
  Color color;
  switch(state)
  {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

