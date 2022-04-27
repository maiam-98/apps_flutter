class PostModel {
  late String name;
  late String uId;
  late String image;
  late String text;
  late String dateTime;
  late String postImage;

  PostModel
      ({
    required this.name,
    required this.uId,
    required this.image,
    required this.text,
    required this.dateTime,
    required this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];
    uId = json['uId'];
    text = json['text'];
    dateTime = json['dateTime'];
    image = json['image'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toMap()
  {
    return
      {
        'name': name,
        'uId': uId,
        'text': text,
        'dateTime': dateTime,
        'image': image,
        'postImage': postImage,
      };
  }
}