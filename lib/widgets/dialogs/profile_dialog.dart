import 'package:ayanchat/models/chat_user.dart';
import 'package:ayanchat/screens/view_profile_screen.dart';
import 'package:ayanchat/utils/media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({super.key, required this.user});

  final ChatUser user;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white.withOpacity(.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: SizedBox(
        width: AppLayout.getWidth(100),
        height: AppLayout.getHeight(260),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(mq.height * .50),
                child: CachedNetworkImage(
                  height: mq.height * .22,
                  width: mq.width * .5,
                  fit: BoxFit.cover,
                  imageUrl: user.image,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Icon(FluentSystemIcons.ic_fluent_person_accounts_regular),
                ),
              ),
            ),
            Positioned(
              left: mq.width * .04,
              top: mq.height * .015,
              width: mq.width * .55,
              child: Text(
                user.name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ViewProfileScreen(user: user)));
                  },
                  minWidth: 0,
                  padding: EdgeInsets.all(0),
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                    size: 30,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
