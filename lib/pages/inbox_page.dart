import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/models/message_model.dart';
import 'package:social_media_app/services/database.dart';
import 'package:social_media_app/pages/chat_screen.dart';
class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPage();
}
class _InboxPage extends State<InboxPage>{

  List<InboxDatabase> chatList = [];
  @override
  void initState() {
    super.initState();
    fetchVideosData();
  }

  fetchVideosData() async {
    dynamic result = await UsersDatabaseManager().getItemList();
    if (result == null) {
      print("Video list null");
    } else {
      setState(() {
        chatList = result;
      });
    }
    print('Inbox:${chatList.length}');
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        elevation: 0.25,
        title: Row(
            children:  [
              Text(' Inbox ', style: TextStyle(color: Colors.black)),
              const SizedBox(width: 20),
              SvgPicture.asset("assets/icons8-mailbox.svg"),

              ]),
          backgroundColor: Colors.white,
          ),



      body:ListView.builder(
        itemCount: chatList.length,
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
                  backgroundImage: NetworkImage(chatList[index].imageURL.toString()),
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

                            Text(chatList[index].name.toString(), style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                            ),


                            // Text(chat.time,style: TextStyle(
                            //   fontSize:11,
                            //   fontWeight:FontWeight.w300,
                            //   color: Colors.black54,
                            // ),),

                      ],
                    ),
                    SizedBox(
                      height:10,

                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child:chat.unread ?Text(chatList[index].text.toString(),
                        style: TextStyle(fontSize: 13,
                            color: Colors.black,fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines:2,
                      ):
                      Text(chatList[index].text.toString(),
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
