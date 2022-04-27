import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/layout/social_app/cudit/cudit.dart';
import 'package:flutter_app3/layout/social_app/cudit/state.dart';import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/cubit/cubit.dart';
import 'package:flutter_app3/shard/styles/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPost extends StatelessWidget {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: defaultAppBar(
                context: context,
                text: 'Create Post',
                action:
                [
                  TextButton(
                    onPressed: ()
                    {
                      final now = DateTime.now();
                      if(SocialAppCubit.get(context).postImage == null)
                        {
                      SocialAppCubit.get(context).createPostData(
                          text: textController.text,
                          dateTime:now.toString(),
                      );
                        }else{
                        SocialAppCubit.get(context).uploadPostImage(
                            text: textController.text,
                          dateTime:now.toString(),
                        );
                      }
                    },
                    child: Text(
                        'Post'
                    ),
                  ),
                ]
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:
              [
                if(state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                  children:
                  [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://img.freepik.com/free-photo/horizontal-shot-pretty-dark-skinned-woman-with-afro-hairstyle-has-broad-smile-white-teeth-shows-something-nice-friend-points-upper-right-corner-stands-against-wall_273609-16442.jpg?w=996'),
                      radius: 27.0,
                    ),
                    SizedBox(
                      width: 14.0,
                    ),
                    Text(
                      'Mariam Al-odini',
                      style: TextStyle(
                        height: 1.4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'what is on your mind ...',
                        border: InputBorder.none
                    ),
                  ),
                ),
                if(SocialAppCubit.get(context).postImage != null)
                  Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            height: 200.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image:FileImage(SocialAppCubit.get(context).postImage!),
                                fit: BoxFit.cover,

                              ),
                            ),

                          ),
                          IconButton(
                            onPressed: ()
                            {
                              SocialAppCubit.get(context).removeImage();
                            },
                            icon: CircleAvatar(
                              radius: 20.0,
                              child: Icon(
                                Icons.close,
                                size: 19.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: ()
                          {
                            SocialAppCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center ,
                            children:
                            [
                              Icon(
                                IconBroken.Image,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'add photo'
                              ),
                            ],
                          ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: (){},
                          child: Text(
                            '# tags'
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
