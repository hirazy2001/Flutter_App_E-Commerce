class Message {
  String roomId;
  String senderId;
  String content;

  Message(
      {required this.content, required this.senderId, required this.roomId});
}
