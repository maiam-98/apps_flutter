
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/models/social_model/social_user_model.dart';
import 'package:flutter_app3/modules/social_app/chat_details/chat_details_screen.dart';
import 'package:flutter_app3/layout/social_app/cudit/cudit.dart';
import 'package:flutter_app3/layout/social_app/cudit/state.dart';import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppState>
      (
      listener: (context, state) {},
      builder: (context, state)
      {
       return ConditionalBuilder(
         condition: SocialAppCubit.get(context).users.length > 0,
         builder: (context) => ListView.separated(
           itemBuilder: (context,index) => buildUsersItem(SocialAppCubit.get(context).users[index],context),
           separatorBuilder: (context, index) => SizedBox(
             height: 5.0,
           ),
           itemCount: SocialAppCubit.get(context).users.length,

         ),
         fallback: (context) =>Center(child: CircularProgressIndicator()),
       );
      },
    );
  }

  Widget buildUsersItem(SocialUserModel model,context) => InkWell(
    onTap: (){
      navigateTo(context, ChatDetailsScreen(
        userModel: model,
      ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
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
          Text(
            '${model.name}',
            style: TextStyle(
              height: 1.4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

