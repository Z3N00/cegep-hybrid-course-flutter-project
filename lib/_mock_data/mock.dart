import 'package:social_media_app/models/user.dart';
import 'package:social_media_app/models/video.dart';

User currentUser = User('stackedlist', "https://picsum.photos/id/1062/400/400");

User demoUser1 = User('user_1', "https://picsum.photos/id/1062/400/400");

User demoUser2 = User("user_2", "https://picsum.photos/id/1062/400/400");

User demoUser3 = User("user_3", "https://picsum.photos/id/1062/400/400");

User demoUser4 = User("user_4", "https://picsum.photos/id/1062/400/400");


final List<Video> videos = [
  Video("video0.mp4", demoUser1, "caption", "audioName", "123M", "123k"),
  Video("video1.mp4", demoUser2, "caption", "audioName", "12", "10"),
  Video("video3", demoUser3, "caption", "audioName", "100", "12"),
];