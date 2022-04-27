import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app3/layout/social_app/cudit/state.dart';
import 'package:flutter_app3/models/social_model/message_model.dart';
import 'package:flutter_app3/models/social_model/post_model.dart';
import 'package:flutter_app3/models/social_model/social_user_model.dart';
import 'package:flutter_app3/modules/basics_app/users/Users_Screen.dart';
import 'package:flutter_app3/modules/social_app/add_post/add_post_screen.dart';
import 'package:flutter_app3/modules/social_app/chats/chats_screen.dart';
import 'package:flutter_app3/modules/social_app/feeds/feeds_screen.dart';
import 'package:flutter_app3/modules/social_app/setting/setting_screen.dart';
import 'package:flutter_app3/modules/social_app/users/user_screen.dart';
import 'package:flutter_app3/shard/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialAppCubit extends Cubit<SocialAppState> {
  SocialAppCubit()  : super(SocialAppInitialState());

  static SocialAppCubit get(context) => BlocProvider.of(context);

  SocialUserModel? userModel;

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      //print(value.data());
      userModel = SocialUserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  List<Widget> screen =
  [
    FeedScreen(),
    ChatScreen(),
    AddPost(),
    UserScreen(),
    SettingScreen()
  ];

  List<String> titles =
  [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings'
  ];

  int currentIndex = 0;

  void changeBottom(int index) {
    if (index == 1)
      getUsers();

    if (index == 2)
      emit(SocialAddPostState());
    else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  File? profileImage = File('');
  final ImagePicker picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverImage = File('');

  Future<void> getCoverImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialCoverImagePickedErrorState());
    }
  }


  void uploadImageProfile({
    required String name,
    required String bio,
    required String phone,
  }) {
    emit(SocialUpdateUserLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
        //emit(SocialUpdateProfileImageSuccessState());
      }).catchError((error) {
        emit(SocialUpdateProfileImageErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialUpdateProfileImageErrorState());
    });
  }


  void uploadImageCover({
    required String name,
    required String bio,
    required String phone,
  }) {
    emit(SocialUpdateUserLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(coverImage!.path)
        .pathSegments
        .last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
        // emit(SocialUpdateCoverImageSuccessState());
      }).catchError((error) {
        emit(SocialUpdateCoverImageErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialUpdateCoverImageErrorState());
    });
  }

  /*void updateUserImage({
  required String name,
  required String bio,
  required String phone,
})
  {
    emit(SocialUpdateUserLoadingState());
   if(coverImage != null)
      {
        updateImageCover();
      }else if(profileImage != null){
      updateImageProfile();
    }else if(coverImage != null && profileImage != null){

    }else{
      updateUserData(name: name, bio: bio, phone: phone);
    }

  }*/

  void updateUserData({
    required String name,
    required String bio,
    required String phone,
    String? image,
    String? cover,
  }) {
    SocialUserModel model = SocialUserModel(
      bio: bio,
      name: name,
      uId: userModel!.uId,
      email: userModel!.email,
      image: image ?? userModel!.image,
      cover: cover ?? userModel!.cover,
      phone: phone,

    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(model.uId)
        .update(model.toMap()).then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUpdateUserErrorState());
    });
  }

  File? postImage = File('');

  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialPostImagePickedErrorState());
    }
  }


  void uploadPostImage({
    required String text,
    required String dateTime,
  }) {
    emit(SocialCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('post/${Uri
        .file(postImage!.path)
        .pathSegments
        .last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPostData(
          text: text,
          dateTime: dateTime,
          postImage: value,
        );
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreatePostErrorState());
    });
  }

  void createPostData({
    required String text,
    required String dateTime,
    String? postImage,
  }) {
    emit(SocialCreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      text: text,
      dateTime: dateTime,
      postImage: postImage ?? '',
    );

    FirebaseFirestore.instance
        .collection('post')
        .add(model.toMap()).then((value) {
      emit(SocialCreatePostSuccessesState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  void removeImage() {
    postImage;
    emit(SocialRemovePostImageSuccessState());
  }

  List<PostModel> post = [];
  List<String> postsId = [];
  List<int> like = [];
  List<int> comment = [];

  void getPost() {
    FirebaseFirestore.instance
        .collection('post')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference
            .collection('like')
            .get()
            .then((value) {
          like.add(value.docs.length);
          postsId.add(element.id);
          post.add(PostModel.fromJson(element.data()!));
        });
        comment.add(value.docs.length);
      });
      print(post.length);
      print('hallo');
      emit(SocialGetPostSuccessState());
    })
        .catchError((error) {
      emit(SocialGetPostErrorState());
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('post')
        .doc(postId)
        .collection('like')
        .doc(userModel!.uId)
        .set({
      'Like': true,
    })
        .then((value) {
      emit(SocialLikesPostSuccessesState());
    })
        .catchError((error) {
      emit(SocialLikesPostErrorState(error));
    });
  }

  void commentPost(String postId) {
    FirebaseFirestore.instance
        .collection('post')
        .doc(postId)
        .collection('comments')
        .doc(userModel!.uId)
        .set({
      'comment': true,
    })
        .then((value) {
      emit(SocialCommentPostSuccessesState());
    })
        .catchError((error) {
      emit(SocialCommentPostErrorState(error));
    });
  }

  List<SocialUserModel> users = [];

  void getUsers() {
    print(users.length);
    if (users.length == 0)
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if (element.data()!['uId'] != userModel!.uId)
            users.add(SocialUserModel.fromJson(element.data()!));
        });
        emit(SocialGetAllUsersSuccessState());
      })
          .catchError((error) {
        print(error.toString());
        emit(SocialGetAllUsersErrorState(error.toString()));
      });
  }

  void sendMessage({
    required String dateTime,
    required String receiverId,
    required String text,
    String? image,
  }) {
    MessageModel model = MessageModel(
      receiverId: receiverId,
      dataTime: dateTime,
      senderId: userModel!.uId,
      text: text,
      image: image!,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    })
        .catchError((error) {
      emit(SocialSendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel!.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    })
        .catchError((error) {
      emit(SocialSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];
  void getMessage({
    required String receiverId
  })
  {

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dataTime')
        .snapshots()
        .listen((event)
    {
      messages = [];

      event.docs.forEach((element)
      {
        messages.add(MessageModel.fromJson(element.data()!));
      });
      emit(SocialGetMessageSuccessState());
    });
  }

  File? chatImage = File('');

  Future<void> getChatImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      chatImage = File(pickedFile.path);
      emit(SocialChatImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialChatImagePickedErrorState());
    }
  }

  void uploadChatImage({
    required String dateTime,
    required String receiverId,
    required String text,
  }) {
    emit(SocialCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${userModel!.uId}/chats/${"receiverId"}/messages/${Uri
        .file(chatImage!.path)
        .pathSegments
        .last}')
        .putFile(chatImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        sendMessage(
          text: text,
          image: value,
          dateTime: dateTime,
          receiverId: receiverId,
        );
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreatePostErrorState());
    });
  }
}