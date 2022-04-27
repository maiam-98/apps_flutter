import 'package:flutter_app3/layout/social_app/cudit/cudit.dart';

abstract class SocialAppState {}

class SocialAppInitialState extends SocialAppState {}

class SocialGetUserLoadingState extends SocialAppState {}

class SocialGetUserSuccessState extends SocialAppState {}

class SocialGetUserErrorState extends SocialAppState
{
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialGetAllUsersLoadingState extends SocialAppState {}

class SocialGetAllUsersSuccessState extends SocialAppState {}

class SocialGetAllUsersErrorState extends SocialAppState
{
  final String error;

  SocialGetAllUsersErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialAppState {}

class SocialAddPostState extends SocialAppState {}

class SocialProfileImagePickedSuccessState extends SocialAppState {}

class SocialProfileImagePickedErrorState extends SocialAppState {}

class SocialCoverImagePickedSuccessState extends SocialAppState {}

class SocialCoverImagePickedErrorState extends SocialAppState {}

class SocialUpdateProfileImageSuccessState extends SocialAppState {}

class SocialUpdateProfileImageErrorState extends SocialAppState {}

class SocialUpdateCoverImageSuccessState extends SocialAppState {}

class SocialUpdateCoverImageErrorState extends SocialAppState {}

class SocialUpdateUserLoadingState extends SocialAppState {}

class SocialUpdateUserErrorState extends SocialAppState {}

class SocialLikesPostSuccessesState extends SocialAppState {}

class SocialLikesPostErrorState extends SocialAppState {
  final String error;

  SocialLikesPostErrorState(this.error);
}

class SocialCommentPostSuccessesState extends SocialAppState {}

class SocialCommentPostErrorState extends SocialAppState {
  final String error;

  SocialCommentPostErrorState(this.error);
}


//Create Post

class SocialCreatePostLoadingState extends SocialAppState {}

class SocialCreatePostErrorState extends SocialAppState {}

class SocialCreatePostSuccessesState extends SocialAppState {}

class SocialPostImagePickedSuccessState extends SocialAppState {}

class SocialPostImagePickedErrorState extends SocialAppState {}

class SocialRemovePostImageSuccessState extends SocialAppState {}

class SocialGetPostSuccessState extends SocialAppState {}

class SocialGetPostErrorState extends SocialAppState {}

//messages

class SocialSendMessageSuccessState extends SocialAppState {}

class SocialSendMessageErrorState extends SocialAppState {}

class SocialGetMessageSuccessState extends SocialAppState {}

class SocialGetMessageErrorState extends SocialAppState {}

class SocialChatImagePickedSuccessState extends SocialAppState {}

class SocialChatImagePickedErrorState extends SocialAppState {}