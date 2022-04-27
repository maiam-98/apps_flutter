import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app3/models/social_model/post_model.dart';
import 'package:flutter_app3/layout/social_app/cudit/cudit.dart';
import 'package:flutter_app3/layout/social_app/cudit/state.dart';import 'package:flutter_app3/shard/styles/colors.dart';
import 'package:flutter_app3/shard/styles/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: SocialAppCubit.get(context).post.length > 0 && SocialAppCubit.get(context).userModel != null,
          builder: (BuildContext context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children:
              [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 10.0,
                  margin: EdgeInsetsDirectional.all(8.0),
                  child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children:
                      [
                        Image(
                          image: NetworkImage('https://img.freepik.com/free-photo/beautiful-black-woman-with-afro-curls-hairstyle-smiling-model-summer-clothes_158538-19742.jpg?w=996'),
                          fit: BoxFit.cover,
                          height: 220.0,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'communicated with friends',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildPostItem(SocialAppCubit.get(context).post[index],context ,index),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5.0,
                  ),
                  itemCount: SocialAppCubit.get(context).post.length,
                ),
              ],
            ),
          ),
          fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget buildPostItem(PostModel model, context , index) => Card(

  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 10.0,
  margin: EdgeInsets.symmetric(
    horizontal: 8.0,
  ),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Row(
          children:
          [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  '${model.image}'
              ),
              radius: 27.0,
            ),
            SizedBox(
              width: 14.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${model.name}',
                        style: TextStyle(
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.check_circle_rounded,
                        color: Colors.blue,
                        size: 17.0,
                      ),
                    ],
                  ),
                  Text(
                    '${model.dateTime}',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.more_horiz,
                size: 16.0,
              ) ,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
          ),
          child: Container(
            height: 1.1,
            color: Colors.grey[300],
            width: double.infinity,
          ),
        ),
        Text(
          '${model.text}.',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10.0,
            top: 5.0,
          ),
          child: Container(
            width: double.infinity,
            child: Wrap(
              children:
              [
                Container(
                  height: 25.0,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 5.0,
                    ),
                    child: MaterialButton(
                      minWidth: 1.0,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text(
                        '#software_engneering',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if(model.postImage != '')
          Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              image: DecorationImage(
                image:NetworkImage(
                    '${model.postImage}'
                ),
                fit: BoxFit.cover,

              ),
            ),

          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          child: Row(
            children:
            [
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Row(
                      children:
                      [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 3.0,
                          ),
                          child: Icon(
                            IconBroken.Heart,
                            size: 16.0,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${SocialAppCubit.get(context).like[index]}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:
                      [
                        Icon(
                          IconBroken.Chat,
                          size: 16.0,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${SocialAppCubit.get(context).comment[index]}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 7.0,
          ),
          child: Container(
            height: 1.1,
            color: Colors.grey[300],
            width: double.infinity,
          ),
        ),
        InkWell(
          onTap: (){},
          child: Row(
            children:
            [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('${SocialAppCubit.get(context).userModel!.image}'),
                      radius: 17.0,
                    ),
                    SizedBox(
                      width: 14.0,
                    ),
                    InkWell(
                      onTap: ()
                      {
                        SocialAppCubit.get(context).commentPost(SocialAppCubit.get(context).postsId[index]);
                      },
                      child: Text(
                        'write a comment ...',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: ()
                {
                  SocialAppCubit.get(context).likePost(SocialAppCubit.get(context).postsId[index]);
                },
                child: Row(
                  children:
                  [
                    Icon(
                      IconBroken.Heart,
                      size: 16.0,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Like',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),

      ],
    ),
  ),

);