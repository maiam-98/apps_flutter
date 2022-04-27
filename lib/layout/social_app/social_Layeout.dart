import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/social_app/cudit/cudit.dart';
import 'package:flutter_app3/layout/social_app/cudit/state.dart';
import 'package:flutter_app3/modules/social_app/add_post/add_post_screen.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/styles/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state)
      {
        if(state is SocialAddPostState)
          {
            navigateTo(context, AddPost());
          }
      },
      builder: (context, state)
      {
        var cubit = SocialAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification)),
              IconButton(onPressed: (){}, icon: Icon(IconBroken.Search)),
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap:(index)
              {
                cubit.changeBottom(index);
              },
              items:
              [
                BottomNavigationBarItem(
              icon:Icon(
              IconBroken.Home
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
              icon:Icon(
              IconBroken.Chat,
                  ),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
              icon:Icon(
              IconBroken.Paper_Upload,
                  ),
                  label: 'Post',
                ),
                BottomNavigationBarItem(
              icon:Icon(
              IconBroken.Location,
                  ),
                  label: 'Users',
                ),
                BottomNavigationBarItem(
              icon:Icon(
              IconBroken.Setting,
                  ),
                  label: 'Setting',
                ),
              ],
          ),
        );
      },
    );
  }
}
