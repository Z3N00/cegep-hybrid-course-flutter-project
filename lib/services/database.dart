import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/video.dart';


class VideosOne{
  String? audio,caption,video,username,imageUrl;
  int? comments,likes;
  VideosOne({this.audio,this.caption,this.video,this.username,this.comments,this.likes, this.imageUrl});
}

List<VideosOne> videosList = [];
class InboxDatabase{
  String? imageURL,name,text;
  bool? unread;
  InboxDatabase({this.imageURL,this.name,this.text,this.unread});
}
List<InboxDatabase> chatList = [];

class UsersDatabaseManager{
  Future getItemList() async {
    final CollectionReference users =
    FirebaseFirestore.instance.collection('Inbox');
    try{
      chatList.clear();
      var snapshot1 = await users.get();
      snapshot1.docs.forEach((element) {
        Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
        if (data != null) {
          var itemEntity = InboxDatabase();
          itemEntity.imageURL = data['imageURL'];
          itemEntity.name = data['name'];
          itemEntity.text = data['text'];
          itemEntity.unread = data['unread'];


          chatList.add(itemEntity);
        } else {
          print("error:");
        }
      });
      return chatList;
    }
    catch (e) {
      print("Error : ${e.toString()}");
      return [];
    }
  }
}
class DatabaseManager {
  Future getItemList() async {
    final CollectionReference reference =
    FirebaseFirestore.instance.collection('Videos');
    try {
      videosList.clear();
      var snapshot = await reference.get();
      snapshot.docs.forEach((element) {
        Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
        if (data != null) {
          var itemEntity = VideosOne();
          itemEntity.audio = data['audio'];
          itemEntity.video = data['video'];
          itemEntity.caption = data['caption'];
          itemEntity.username = data['username'];
          itemEntity.comments = data['comments'];
          itemEntity.likes = data['likes'];
          itemEntity.imageUrl = data['imageUrl'];

          videosList.add(itemEntity);
        } else {
          print("error:");
        }
      });
      return videosList;
    } catch (e) {
      print("Error : ${e.toString()}");
      return [];
    }
  }
}
