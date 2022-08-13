import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g_chat/pages/group_info.dart';
import 'package:g_chat/service/database_service.dart';
import 'package:g_chat/widgets/widgets.dart';

class chatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const chatPage(
      {Key? key,
      required this.groupId,
      required this.groupName,
      required this.userName})
      : super(key: key);

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  Stream<QuerySnapshot>? chats;
  String admin = "";
  @override
  void initState() {
    // TODO: implement initState
    getChatandAdmin();
    super.initState();
  }

  getChatandAdmin(){
   DatabaseService().getChats(widget.groupId).then((val) {
      setState(() {
        chats = val;
      });
    });
    DatabaseService().getGroupAdmin(widget.groupId).then((val) {
      setState(() {
        admin = val;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(context, groupInfo(
                  groupId: widget.groupId,
                  groupName: widget.groupName,
                  adminName: admin,
                ));
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: Center(
        child: Text(widget.groupName),
      ),
    );
  }
}
