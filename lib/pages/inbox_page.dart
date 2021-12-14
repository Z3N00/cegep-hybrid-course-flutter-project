import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.menu),onPressed: (){},),
        title: Text(' Inbox ',),
        actions: <Widget>[
          IconButton( icon: Icon(Icons.search),
            onPressed: (){},),
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child:Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      width: 1.5,
                    color:Colors.black),

                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
          ]
                  ),
                    child:CircleAvatar(
                      radius: 35,
                  backgroundImage: AssetImage("assets/simar.jpg"),//NetworkImage("https://picsum.photos/id/1062/400/400"),
                ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.65,

                  padding: EdgeInsets.only(left: 20,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Simarjit Singh', style: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.bold),),
                          Text('23:12',style: TextStyle(
                          fontSize:11,
                            fontWeight:FontWeight.w300,
                            color: Colors.black54,
                          ),)
                        ],
                      ),
                      SizedBox(
                        height:10,

                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child:Text('Please follow me ..!💜️',
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child:Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                          width: 1.5,
                          color:Colors.black),

                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                      ]
                  ),
                  child:CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/inder.jpg"),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.65,

                  padding: EdgeInsets.only(left: 20,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Inderpreet Singh', style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold),),
                          Text('01:30',style: TextStyle(
                            fontSize:11,
                            fontWeight:FontWeight.w300,
                            color: Colors.black54,
                          ),)
                        ],
                      ),
                      SizedBox(
                        height:10,

                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child:Text('Ki haal aa bro 💪❤️',
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child:Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                          width: 1.5,
                          color:Colors.black),

                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                      ]
                  ),
                  child:CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage("https://picsum.photos/id/1062/400/400"),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.65,

                  padding: EdgeInsets.only(left: 20,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Simarjit Singh', style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold),),
                          Text('23:12',style: TextStyle(
                            fontSize:11,
                            fontWeight:FontWeight.w300,
                            color: Colors.black54,
                          ),)
                        ],
                      ),
                      SizedBox(
                        height:10,

                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child:Text('Hey There, I am simarjit singh. I love you so much.❤  Hey There, I am simarjit singh. I love you so much.❤️',
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child:Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                          width: 1.5,
                          color:Colors.black),

                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                      ]
                  ),
                  child:CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage("https://picsum.photos/id/1062/400/400"),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.65,

                  padding: EdgeInsets.only(left: 20,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Simarjit Singh', style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold),),
                          Text('23:12',style: TextStyle(
                            fontSize:11,
                            fontWeight:FontWeight.w300,
                            color: Colors.black54,
                          ),)
                        ],
                      ),
                      SizedBox(
                        height:10,

                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child:Text('Hey There, I am simarjit singh. I love you so much.❤  Hey There, I am simarjit singh. I love you so much.❤️',
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child:Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                          width: 1.5,
                          color:Colors.black),

                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                      ]
                  ),
                  child:CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage("https://picsum.photos/id/1062/400/400"),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.65,

                  padding: EdgeInsets.only(left: 20,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Simarjit Singh', style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold),),
                          Text('23:12',style: TextStyle(
                            fontSize:11,
                            fontWeight:FontWeight.w300,
                            color: Colors.black54,
                          ),)
                        ],
                      ),
                      SizedBox(
                        height:10,

                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child:Text('Hey There, I am simarjit singh. I love you so much.❤  Hey There, I am simarjit singh. I love you so much.❤️',
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child:Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                          width: 1.5,
                          color:Colors.black),

                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                      ]
                  ),
                  child:CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage("https://picsum.photos/id/1062/400/400"),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.65,

                  padding: EdgeInsets.only(left: 20,),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Simarjit Singh', style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold),),
                          Text('23:12',style: TextStyle(
                            fontSize:11,
                            fontWeight:FontWeight.w300,
                            color: Colors.black54,
                          ),)
                        ],
                      ),
                      SizedBox(
                        height:10,

                      ),
                      Container(child:Text('Hey There, I am simarjit singh. I love you so much.❤  Hey There, I am simarjit singh. I love you so much.❤️',
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

         // Container(child:Text('Hey There, I am simarjit singh')),
         // Container(child:Text('I Love you')),
          //Container(child:Text('Hey There, I am simarjit singh')),
        ],
      ),

    );
  }
}
