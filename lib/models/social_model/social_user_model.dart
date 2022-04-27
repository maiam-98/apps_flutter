class SocialUserModel {
  late String name;
  late String email;
  late String phone;
  late String uId;
  late String image;
  late String bio;
  late String cover;
  bool? isEmailVerified;

  SocialUserModel
      ({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.image,
    required this.bio,
    required this.cover,
    this.isEmailVerified,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    bio = json['bio'];
    cover = json['cover'];
    image = json['image'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap()
  {
    return
    {
      'email': email,
      'name': name,
      'phone': phone,
      'uId': uId,
      'bio': bio,
      'cover': cover,
      'image': image,
      'isEmailVerified': isEmailVerified,
    };
  }
}