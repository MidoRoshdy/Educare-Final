// ignore_for_file: unnecessary_import, camel_case_types, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

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
import 'package:sizer/sizer.dart';

class T_ChatScreen extends StatefulWidget {
  final String receiveruseremail;
  final String receiverId;
  const T_ChatScreen(
      {super.key, required this.receiveruseremail, required this.receiverId});

  @override
  State<T_ChatScreen> createState() => _T_ChatScreenState();
}

class _T_ChatScreenState extends State<T_ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final MessagesServices _cahtService = MessagesServices();
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  FocusNode myFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(
          Duration(milliseconds: 500),
          () => scrollDown,
        );
        print('TextField got the focus');
      } else {
        print('TextField lost the focus');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
      await _cahtService.SendMessage(
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

  //build message list
  Widget _buildMessageList() {
    String senderID = _firebaseauth.currentUser!.uid;
    return StreamBuilder(
      stream: _cahtService.getMessages(widget.receiverId, senderID),
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
          child: ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((document) => _buildMessageitem(document))
                .toList(),
          ),
        );
      },
    );
  }

//build message item
  Widget _buildMessageitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = data['senderId'] == _firebaseauth.currentUser!.uid
        ? Alignment.centerLeft
        : Alignment.topRight;
    return Container(
        alignment: alignment,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(4.sp),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColours.CHAT,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                data["message"],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          // Text(data["timestamp"].toString())
        ]));
  }

//build message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        //text field
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          child: Container(
            height: 8.h,
            width: 85.w,
            margin: EdgeInsets.only(bottom: 2.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.sp, color: AppColours.neutral500)),
            child: TextField(
              focusNode: myFocusNode,
              controller: _messageController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Type a message",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
        ),
        //send button
        IconButton(
          onPressed: sendMessage,
          icon: Icon(
            Iconsax.arrow_right,
            color: Colors.black,
            size: 20.sp,
          ),
        )
      ],
    );
  }
}
// SafeArea(
//         child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: Stack(children: [
//               Image.asset(
//                 Assets.colorhome,
//                 fit: BoxFit.fill,
//                 width: 100.w,
//                 height: 20.h,
//               ),
//               Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(children: [
//                     Divider(
//                       height: 1.h,
//                       color: Colors.transparent,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Icon(
//                                 Iconsax.arrow_left_2,
//                                 color: Colors.white,
//                                 size: 20.sp,
//                               ),
//                             ),
//                             const Spacer(),
//                             Image.asset(
//                               Assets.logoonx2,
//                               height: 4.h,
//                             )
//                           ]),
//                     ),
//                     Text(widget.receiveruseremail,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17.sp,
//                             fontWeight: FontWeight.w700)),
//                     Divider(
//                       height: 6.h,
//                       color: Colors.transparent,
//                     ),