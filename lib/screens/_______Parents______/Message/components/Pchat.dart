// ignore_for_file: unnecessary_import, camel_case_types, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educare/core/Assets.dart';
import 'package:educare/core/colors.dart';
import 'package:educare/screens/_______for%20all%20user______/services/chat%20services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class P_ChatScreen extends StatefulWidget {
  final String receiveruseremail;
  final String receiverUserId;
  final String receiverId;
  const P_ChatScreen(
      {super.key,
      required this.receiveruseremail,
      required this.receiverUserId,
      required this.receiverId});

  @override
  State<P_ChatScreen> createState() => _P_ChatScreenState();
}

class _P_ChatScreenState extends State<P_ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final MessagesServices _chatService = MessagesServices();
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(
          Duration(milliseconds: 500),
          () => scrollDown(), // Corrected invocation of the function
        );
        print('TextField got the focus');
      } else {
        print('TextField lost the focus');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
    _messageController.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
        widget.receiverId,
        _messageController.text,
      );
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColours.CHAT,
        title: Text(
          widget.receiveruseremail,
          style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Iconsax.arrow_left_2),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _firebaseauth.currentUser!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: _chatService.getMessages(senderID, widget.receiverId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            "Error: ${snapshot.error}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "loading...",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  CircularProgressIndicator()
                ],
              ),
            ],
          ));
        }
        return SizedBox(
          height: 50.h,
          width: 100.w,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return _buildMessageitem(snapshot.data!.docs[index]);
            },
          ),
        );
      },
    );
  }

  //build message item
  Widget _buildMessageitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    bool isSender = data['senderid'] == _firebaseauth.currentUser!.uid;
    var alignment = isSender ? Alignment.centerRight : Alignment.centerLeft;
    var backgroundColor = isSender ? AppColours.CHAT : AppColours.neutral100;
    var textColor = isSender ? Colors.white : Colors.black;
    var timestamp = data['timestamp'] as Timestamp;
    DateTime dateTime = timestamp.toDate();
    String formattedTime = DateFormat('h:mm a').format(dateTime);

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isSender
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start, // Align text based on sender
        children: [
          Padding(
            padding: EdgeInsets.all(4.sp),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: isSender
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    data["message"],
                    style: TextStyle(
                        color: textColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  Text(
                    formattedTime, // Display formatted time
                    style: TextStyle(
                        fontSize: 8.sp,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h, left: 2.w, right: 2.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          //text field
          Expanded(
            child: TextField(
              focusNode: myFocusNode,
              controller: _messageController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Type a message",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none, // Remove default border
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          //send button
          IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.send, // Changed the icon to a standard "send" icon
              color: Colors.black,
              size: 20.sp,
            ),
          )
        ],
      ),
    );
  }
}
