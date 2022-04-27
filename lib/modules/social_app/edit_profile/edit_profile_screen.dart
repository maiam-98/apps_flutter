import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/models/social_model/social_user_model.dart';
import 'package:flutter_app3/layout/social_app/cudit/cudit.dart';
import 'package:flutter_app3/layout/social_app/cudit/state.dart';import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/cubit/cubit.dart';
import 'package:flutter_app3/shard/styles/icon_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var userModel = SocialAppCubit.get(context).userModel;
        var profileImage = SocialAppCubit.get(context).profileImage;
        var coverImage = SocialAppCubit.get(context).coverImage;

        nameController.text = userModel!.name;
        bioController.text = userModel.bio;
        phoneController.text = userModel.phone;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: defaultAppBar(
                context: context,
                text: 'Edit Profile',
                action:
                [
                  defaultTextButton(
                      function: ()
                      {
                        SocialAppCubit.get(context).updateUserData(name: nameController.text, bio: bioController.text, phone: phoneController.text);
                      },
                      text: 'Update'
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ]
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
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
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 200.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only
                                    (
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: (coverImage == null) ? NetworkImage(
                                        '${userModel.cover}'
                                    ) as ImageProvider: FileImage(coverImage),
                                    fit: BoxFit.cover,

                                  ),
                                ),

                              ),
                              IconButton(
                                  onPressed: ()
                                  {
                                    SocialAppCubit.get(context).getCoverImage();
                                  },
                                  icon: CircleAvatar(
                                    radius: 20.0,
                                    child: Icon(
                                      IconBroken.Camera,
                                      size: 19.0,
                                    ),
                                  ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            /*CircleAvatar(
                              radius: 62.5,
                              backgroundColor: Theme
                                  .of(context)
                                  .scaffoldBackgroundColor,
                              child: CircleAvatar(
                                backgroundImage: (profileImage == null) ? NetworkImage(
                                    '${userModel.image}'
                                ) as ImageProvider: FileImage(profileImage),
                                radius: 60.0,
                              ),
                            ),*/
                            IconButton(
                                icon: CircleAvatar(
                                  radius: 20.0,
                                    child: Icon(
                                        IconBroken.Camera,
                                      size: 19.0,
                                    )
                                ),
                              onPressed: ()
                              {
                                SocialAppCubit.get(context).getProfileImage();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  if(SocialAppCubit.get(context).profileImage != null ||  SocialAppCubit.get(context).coverImage != null)
                  Row(
                    children:
                    [
                      if(SocialAppCubit.get(context).profileImage != null)

                      Expanded(
                        child: Column(
                          children: [
                            defaultButton(
                                function: ()
                                {
                                  SocialAppCubit.get(context).uploadImageProfile(
                                    name: nameController.text,
                                    bio: bioController.text,
                                    phone: phoneController.text,
                                  );
                                },
                                text: 'Update Profile Image',
                            ),
                            if(state is SocialUpdateUserLoadingState)
                              SizedBox(
                              height: 8.0,
                            ),
                            if(state is SocialUpdateUserLoadingState)
                              LinearProgressIndicator(),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      if(SocialAppCubit.get(context).coverImage != null)
                      Expanded(
                        child: Column(
                          children: [
                            defaultButton(
                                function: ()
                                {
                                  SocialAppCubit.get(context).uploadImageCover(
                                      name: nameController.text,
                                      bio: bioController.text,
                                      phone: phoneController.text,
                                  );
                                },
                                text: 'Update Cover Image',
                            ),
                            if(state is SocialUpdateUserLoadingState)
                              SizedBox(
                              height: 8.0,
                            ),
                            if(state is SocialUpdateUserLoadingState)
                              LinearProgressIndicator(),
                            SizedBox(
                              height: 8.0,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                  if(SocialAppCubit.get(context).profileImage != null ||  SocialAppCubit.get(context).coverImage != null)
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      controll: nameController,
                      textInputType: TextInputType.name,
                      label: 'Name',
                      massageValidation: 'name most not empty',
                      prefix: IconBroken.User,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    controll: bioController,
                    textInputType: TextInputType.text,
                    label: 'Bio',
                    massageValidation: 'bio most not empty',
                    prefix: IconBroken.Info_Circle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    controll: phoneController,
                    textInputType: TextInputType.phone,
                    label: 'Phone',
                    massageValidation: 'phone most not empty',
                    prefix: IconBroken.Call,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
