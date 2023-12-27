import 'package:flutter/material.dart';
import '../job_applied/components/app_empty_space_top.dart';
import 'components_message_screen/message_header.dart';
import 'components_message_screen/recent_chats.dart';

class MessagesScreen extends StatelessWidget {
  static String routeName = "/message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: messageHeader(),
      body: Column(
        children: [
          empty(),
          Expanded(
            child: RecentChatsList(),
          ),
        ],
      ),
    );
  }
}
