import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderid;
  final String senderemail;
  final String receiverid;
  final Timestamp timestamp;
  final String message;

  Message({
    required this.senderid,
    required this.senderemail,
    required this.receiverid,
    required this.timestamp,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderid': senderid,
      'senderemail': senderemail,
      'receiverid': receiverid,
      'timestamp': timestamp,
      'message': message,
    };
  }
}
