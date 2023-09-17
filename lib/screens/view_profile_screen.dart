import 'dart:io';

import 'package:ayanchat/helper/my_date_util.dart';
import 'package:ayanchat/models/chat_user.dart';
import 'package:ayanchat/screens/auth/login_screen.dart';
import 'package:ayanchat/utils/media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../api/apis.dart';
import '../helper/dialogs.dart';
import '../main.dart';

class ViewProfileScreen extends StatefulWidget {
  final ChatUser user;
  const ViewProfileScreen({super.key, required this.user});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text(widget.user.name)),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Join Date: ",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Text(
                MyDateUtil.getLastMessageTime(
                    context: context,
                    time: widget.user.createdAt,
                    showYear: true),
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(50)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: AppLayout.getScreenWidth(),
                  height: AppLayout.getHeight(25),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(mq.height * 100),
                  child: CachedNetworkImage(
                    width: AppLayout.getWidth(150),
                    height: AppLayout.getHeight(150),
                    fit: BoxFit.cover,
                    imageUrl: widget.user.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(
                        FluentSystemIcons.ic_fluent_person_accounts_regular),
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                Text(widget.user.email,
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 16)),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("About: ",
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text(widget.user.about,
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
