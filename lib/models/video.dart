import 'package:social_media_app/models/user.dart';

class Video {
  final String videoUrl;
  final TheUser postedBy;
  final String caption;
  final String audioName;
  final String likes;
  final String comments;
  Video(this.videoUrl, this.postedBy, this.caption, this.audioName, this.likes, this.comments);
}