import 'package:flutter/material.dart';
import '../../model/message_model.dart';
import '../../model/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  // Constructor to receive a user when creating ChatScreen
  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Function to build each message in the chat
  Widget _buildMessage(Message message, bool isMe) {
    // Container to represent a single message bubble
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 80.0, bottom: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).colorScheme.secondary : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0,),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    // If it's a message from the current user, return the message container only
    if (isMe) {
      return msg;
    }

    // If it's a message from others, include an additional like button
    return Row(
      children: [
        msg,
        // IconButton(
        //   icon: message.isLiked
        //       ? Icon(Icons.favorite)
        //       : Icon(Icons.favorite_border),
        //   iconSize: 30.0,
        //   color: message.isLiked ? Theme.of(context).colorScheme.primary : Colors.blueGrey,
        //   onPressed: () {},
        // ),
      ],
    );
  }

  // Function to build the message composer at the bottom
  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(children: [
        IconButton(
          icon: Icon(Icons.photo),
          iconSize: 25.0,
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {},
        ),
        Expanded(
          child:TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {},
            decoration: InputDecoration.collapsed(
              hintText: 'Send a message...'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          iconSize: 25.0,
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {},
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.user.userName,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            // Expanded widget to take remaining height for messages
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0), 
                    topRight: Radius.circular(0.0), 
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0), 
                    topRight: Radius.circular(30.0), 
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      bool isMe = message.sender.userId == currentUser1.userId;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            // Message composer at the bottom
            _buildMessageComposer(),
          ],
        ),
      ) ,
    );
  }
}
