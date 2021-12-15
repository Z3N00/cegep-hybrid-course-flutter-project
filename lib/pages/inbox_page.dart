import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/models/message_model.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/pages/chat_screen.dart';
class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.25,
        title: Row(
            children:  [
              SvgPicture.asset("assets/icons8-mailbox.svg"),
              const SizedBox(width: 20),
              const Text(' Inbox ', style: TextStyle(color: Colors.black),)
            ]
        ),

        backgroundColor: Colors.white,
      ),
      body:ListView.builder(
        itemCount: chats.length,
        itemBuilder:(BuildContext context, int index){
          final Message chat = chats[index];
        return GestureDetector(
              onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(
                user: chat.sender,
              ),
            ),
          ),



          child:Container(padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
          child:Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),


                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                    ]
                ),
                child:CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(chat.sender.imageUrl),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.65,

                padding: EdgeInsets.only(left: 20,),
                child: Column(
                  children: <Widget>[
                    Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text(chat.sender.name, style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                            ),


                            Text(chat.time,style: TextStyle(
                              fontSize:11,
                              fontWeight:FontWeight.w300,
                              color: Colors.black54,
                            ),),

                      ],
                    ),
                    SizedBox(
                      height:10,

                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child:chat.unread?Text(chat.text,
                        style: TextStyle(fontSize: 13,
                            color: Colors.black,fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                      ):
                      Text(chat.text,
                        style: TextStyle(fontSize: 13,
                            color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                      ),

                    ),


                  ],

                ),

              ),
            ],

          ),
          ),
        );
      },

      )


    );
  }
}
