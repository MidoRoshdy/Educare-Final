// ignore_for_file: unused_import, non_constant_identifier_names, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/generated/intl/messages_en.dart';
import 'package:educare/screens/_______for%20all%20user______/models/messagemodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessagesServices extends ChangeNotifier {
  //get instance of auth and firestore
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //send message
  Future<void> SendMessage(
    String receiverId,
    String message,
  ) async {
    //get current user info
    final String currentUserId = _firebaseauth.currentUser!.uid;
    final String currentUserEmail =
        _firebaseauth.currentUser!.email!.toString();
    final Timestamp timestamp = Timestamp.now();

    //create message
    Message newMessage = Message(
      senderid: currentUserId,
      senderemail: currentUserEmail,
      receiverid: receiverId,
      timestamp: timestamp,
      message: message,
    );

    // Sort the user IDs to create a consistent chat room ID
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    //save message to firestore
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  //get messages
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // Sort the user IDs to retrieve the correct chat room ID
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
