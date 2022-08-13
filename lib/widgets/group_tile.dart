// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:g_chat/pages/chat_page.dart';
import 'package:g_chat/widgets/widgets.dart';

class groupTile extends StatefulWidget {
  final String userName;
  final String groupId;
  final String groupName;
  const groupTile(
      {Key? key,
      required this.groupId,
      required this.groupName,
      required this.userName})
      : super(key: key);

  @override
  State<groupTile> createState() => _groupTileState();
}

class _groupTileState extends State<groupTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            chatPage(
              groupId: widget.groupId,
              groupName: widget.groupName,
              userName: widget.userName,
            ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(
              widget.groupName.substring(0, 1).toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          title: Text(
            widget.groupName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Join the conversation as ${widget.userName}",
            style: TextStyle(fontSize: 13),
          ),
        ),
      ),
    );
    // return Container(
    //   color: Colors.green,
    // );
  }
}
