import 'package:flutter/material.dart';

import '../../../model/message_model.dart';
import '../chat_screen.dart';

class RecentChatsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final Message message = chats[index];
        return ChatTile(chats: message);
      },
    );
  }
}

class ChatTile extends StatelessWidget {
  final Message chats;

  ChatTile({required this.chats});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(chats.sender.imageUrl),
      ),
      title: Text(chats.sender.userName),
      subtitle: Text(chats.text),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(chats.time),
          if (chats.unread) // Show "NEW" indicator if the message is unread
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'NEW',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      onTap: () => Navigator.push(
        context, 
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              user: chats.sender
            ),
          ),
      ),
        
    );
  }
}

