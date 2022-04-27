import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app3/layout/social_app/cudit/cudit.dart';
import 'package:flutter_app3/layout/social_app/cudit/state.dart';
import 'package:flutter_app3/models/social_model/message_model.dart';
import 'package:flutter_app3/models/social_model/social_user_model.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/styles/colors.dart';
import 'package:flutter_app3/shard/styles/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel userModel;

  ChatDetailsScreen({
    required this.userModel,
});
  var messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController();
    return Builder(
      builder: (BuildContext context)
      {
        SocialAppCubit.get(context).getMessage(receiverId: userModel.uId);
        return BlocConsumer<SocialAppCubit, SocialAppState>(
          listener: (context, state) {},
          builder: (context, state)
          {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0.0,
                elevation: 0.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage:  NetworkImage
                        (
                        userModel.image,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      userModel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
              body: ConditionalBuilder(
                condition: SocialAppCubit.get(context).messages.length > 0 ,
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children:[
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(), 
                            itemBuilder: (context,index)
                            {
                              var message = SocialAppCubit.get(context).messages[index];
                              if(SocialAppCubit.get(context).userModel!.uId == message.senderId)
                                return buildMyMessage(message ,context);
                              return buildMessage(message, context);

                              },
                            separatorBuilder: (context,index) => SizedBox(
                              height: 5.0,
                            ),
                            itemCount: SocialAppCubit.get(context).messages.length
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                ),
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'type message here...'
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 50.0,
                              child: MaterialButton(
                                onPressed: ()
                                {
                                  SocialAppCubit.get(context).sendMessage(
                                    dateTime: DateTime.now().toString(),
                                    receiverId: userModel.uId,
                                    text: messageController.text,
                                  );
                                },
                                minWidth: 1.0,
                                child: Icon(
                                  IconBroken.Send,
                                  color: defaultColor,
                                  size: 25.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 0.5,
                            ),
                            if(SocialAppCubit.get(context).chatImage != null)
                              Container(
                                width: 50.0,
                                child: TextButton(
                                    onPressed: ()
                                    {
                                      SocialAppCubit.get(context).uploadChatImage(
                                        dateTime: DateTime.now().toString(),
                                        receiverId: userModel.uId,
                                        text: messageController.text,
                                      );
                                    },
                                    child: Text('Send')
                                ),
                              ),
                            Container(
                              width: 50.0,

                              child: MaterialButton(
                                onPressed: ()
                                {
                                  SocialAppCubit.get(context).getChatImage() ;
                                },
                                minWidth: 1.0,
                                child: Icon(
                                  IconBroken.Image,
                                  color: defaultColor,
                                  size: 25.0,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            );
          },
        );
      },

    );
  }

  Widget buildMessage(MessageModel model , context)
  {
    if(SocialAppCubit.get(context).chatImage != null)
      return Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
              bottomEnd: Radius.circular(10.0),
            ),
            image: DecorationImage(
              image:FileImage(SocialAppCubit.get(context).chatImage!),
              fit: BoxFit.cover,

            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0
          ),
        ),
      );
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
              bottomEnd: Radius.circular(10.0),
            )
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0
        ),
        child:Text(
          model.text,
        ),
      ),
    );
  }
  Widget buildMyMessage(MessageModel model ,context)
  {
    if(SocialAppCubit.get(context).chatImage != null)
      return Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                bottomEnd: Radius.circular(10.0),
              ),
            image: DecorationImage(
              image:FileImage(SocialAppCubit.get(context).chatImage!),
              fit: BoxFit.cover,

            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0
          ),
        ),
      );
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
            color: defaultColor,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
              bottomStart: Radius.circular(10.0),
            )
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0
        ),
        child: Text(
          model.text,
        ),
      ),
    );
  }


}
