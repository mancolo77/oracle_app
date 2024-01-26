import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderUsername;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.timestamp,
    required this.message,
    required this.receiverId,
    required this.senderUsername,
    required this.senderId, 
});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderUsername,
      'message': message,
      'receiverId': receiverId,
      'timestamp': timestamp
    };
  }

}