import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/models/video.dart';

class DatabaseService {


  late final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');

  Future updateUserdata(String videoUrl, String postedBy, String caption, String audioName, int likes, int comments) async{
    return collectionReference.doc(uid);
  }

}


class VideosOne{
  String? audio,caption,video,username;
  int? comments,likes;
  VideosOne({this.audio,this.caption,this.video,this.username,this.comments,this.likes});
}
List<VideosOne> videosList = [];

class DatabaseManager {
  Future getItemList() async {
    final CollectionReference flowers =
    FirebaseFirestore.instance.collection('Videos');
    try {
      videosList.clear();
      var snapshot = await flowers.get();
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
