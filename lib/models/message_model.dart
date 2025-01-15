class MessageModel {
  dynamic messageId;
  String messageContent;
  String receiverId;
  String receiverMail;
  String senderId;
  String senderMail;

  MessageModel({
    required this.messageContent,
    required this.messageId,
    required this.receiverId,
    required this.receiverMail,
    required this.senderId,
    required this.senderMail,
  });

  // fromMap method
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageContent: map['messageContent'] ?? '',
      messageId: map['messageId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      receiverMail: map['receiverMail'] ?? '',
      senderId: map['senderId'] ?? '',
      senderMail: map['senderMail'] ?? '',
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'messageContent': messageContent,
      'messageId': messageId,
      'receiverId': receiverId,
      'receiverMail': receiverMail,
      'senderId': senderId,
      'senderMail': senderMail,
    };
  }
}
