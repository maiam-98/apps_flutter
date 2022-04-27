class MessageModel {
  late String dataTime;
  late String text;
  late String receiverId;
  late String senderId;
  late String? image;

  MessageModel
      ({
    required this.dataTime,
    required this.text,
    required this.receiverId,
    required this.senderId,
    required this.image,
  });
  MessageModel.fromJson(Map<String, dynamic> json)
  {
    dataTime = json['dataTime'];
    text = json['text'];
    receiverId = json['receiverId'];
    senderId = json['senderId'];
    image = json['image'];

  }

  Map<String, dynamic> toMap()
  {
    return
    {
      'dataTime': dataTime,
      'text': text,
      'receiverId': receiverId,
      'senderId': senderId,
      'image' : image,

    };
  }
}