import 'package:flutter/material.dart';

import '../main.dart';

class ChatUserCard extends StatelessWidget {
  const ChatUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
      color: Colors.blue.shade100,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text("Demo User"),
          subtitle: Text(
            "Last user massage",
            maxLines: 1,
          ),
          trailing: Text(
            "12:00 Pm",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
