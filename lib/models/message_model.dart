

import 'package:social_media_app/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}


List<Message> chats = [
  Message(
    sender: tejveer,
    time: '5:30 PM',
    text: 'Please follow me ..!💜️',
    unread: true,
  ),
  Message(
    sender: Inderpreet,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: simar,
    time: '3:30 PM',
    text: 'I am Happy for you',
    unread: false,
  ),
  Message(
    sender: Anmol,
    time: '2:30 PM',
    text: 'fuck me please!',
    unread: true,
  ),
  Message(
    sender: Daman,
    time: '1:30 PM',
    text: 'Do you want to play games with me?',
    unread: false,
  ),
  Message(
    sender: Aayush,
    time: '12:30 PM',
    text: 'Can I have your number please..!',
    unread: false,
  ),
  Message(
    sender: Sahil,
    time: '11:30 AM',
    text: 'I am glad to have a friend like you.',
    unread: false,
  ),
  Message(
    sender: Kartik,
    time: '12:45 AM',
    text: 'hey there. This is kartik.. ',
    unread: false,
  ),
];

