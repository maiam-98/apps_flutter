import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/social_app/cudit/cudit.dart';
import 'package:flutter_app3/layout/social_app/cudit/state.dart';
import 'package:flutter_app3/modules/social_app/edit_profile/edit_profile_screen.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/styles/colors.dart';
import 'package:flutter_app3/shard/styles/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialAppCubit
            .get(context)
            .userModel
        ;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:
            [
              Container(
                height: 250.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only
                            (
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                '${userModel!.cover}'
                            ),
                            fit: BoxFit.cover,

                          ),
                        ),

                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    CircleAvatar(
                      radius: 62.5,
                      backgroundColor: Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('${userModel.image}'),
                        radius: 60.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${userModel.name}',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${userModel.bio}',
                style: Theme
                    .of(context)
                    .textTheme
                    .caption,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0
                ),
                child: Row(
                  children:
                  [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children:
                          [
                            Text(
                              '50',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'photos',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children:
                          [
                            Text(
                              '500',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Post',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children:
                          [
                            Text(
                              '25K',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'flowing',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children:
                          [
                            Text(
                              '200',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle2,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'flowers',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {  },
                      child: Text(
                        'Add Photo'
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  OutlinedButton(
                    onPressed: ()
                    {
                      navigateTo(context, EditProfile());
                    },
                      child:Icon(
                          IconBroken.Edit,
                        color: defaultColor,
                        size: 16.0,
                      ),
                  ),
                ],
              ),
              Row(
                children:
                [
                  OutlinedButton(
                      onPressed: ()
                      {
                        FirebaseMessaging.instance.subscribeToTopic('announcements');
                      },
                      child: Text(
                          'Subscribe'
                      ),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  OutlinedButton(
                      onPressed: ()
                      {
                        FirebaseMessaging.instance.unsubscribeFromTopic('announcements');

                      }, child: Text(
                      'unSubscribe'
                  ),
                  ),                ],
              ),
            ],
          ),
        );
      },
    );
  }
    }
