import 'package:flutter_application_1/model/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hi, Is this job is still available?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hi, Is this job is still available?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hi, Is this job is still available??',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hi, Is this job is still available?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hi, Is this job is still available?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hi, Is this job is still available?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hi, Is this job is still available?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: currentUser1,
    time: '6:30 PM',
    text: 'Yes',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hi, Is this job is still available?',
    isLiked: true,
    unread: true,
  ),


];