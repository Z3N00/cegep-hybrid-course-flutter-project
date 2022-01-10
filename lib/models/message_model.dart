

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
    sender: Kartik,
    time: '5:30 PM',
    text: 'Please follow me ..!💜️',
    unread: false,
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
    sender: Jaswanth,
    time: '2:30 PM',
    text: 'Can you please give me a ride for tomorrow!',
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

List<Message> messages = [
  Message(
    sender: Inderpreet,
    time: '5:30 PM',
    text: 'Hey dude! Event dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'We could surely handle this mess much easily if you were here.',
    unread: true,
  ),
  Message(
    sender: Inderpreet,
    time: '3:45 PM',
    text: 'Take care of peter. Give him all the protection & his aunt.',

    unread: true,
  ),
  Message(
    sender: Inderpreet,
    time: '3:15 PM',
    text: 'I\'m always proud of her and blessed to have both of them.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'But that spider kid is having some difficulties due his identity reveal by a blog called daily bugle.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Pepper & Morgan is fine. They\'re strong as you. Morgan is a very brave girl, one day she\'ll make you proud.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Yes Tony!',
    unread: true,
  ),
  Message(
    sender: simar,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
  ),
];