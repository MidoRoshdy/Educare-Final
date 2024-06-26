// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/screens/_______for%20all%20user______/models/messagemodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessagesServices extends ChangeNotifier {
  //get instance of auth and firestore
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //send message
  Future<void> sendMessage(String receiverId, String message) async {
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

    // Ensure the chat room document exists before adding a message
    DocumentReference chatRoomDoc =
        _firestore.collection("chat_rooms").doc(chatRoomId);
    DocumentSnapshot chatRoomSnapshot = await chatRoomDoc.get();
    if (!chatRoomSnapshot.exists) {
      await chatRoomDoc.set({'created_at': timestamp});
    }

    // Save message to firestore
    await chatRoomDoc.collection("messages").add(newMessage.toMap());
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
