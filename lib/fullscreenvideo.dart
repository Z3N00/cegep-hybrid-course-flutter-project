// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
//
// class FullScreenVideo extends StatefulWidget {
//   final String videoUrl;   // Video Url from our asset folder
//   const FullScreenVideo({required this.videoUrl});
//
//   @override
//   State<FullScreenVideo> createState() => _FullScreenVideoState();
// }
//
// class _FullScreenVideoState extends State<FullScreenVideo> {
//
//   late VideoPlayerController videoPlayerController;  // Controller to access the videos
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     // initial state of our app and initialising
//     videoPlayerController = VideoPlayerController.asset(widget.videoUrl)..initialize().then((_){
//       setState(() {
//         videoPlayerController.play();
//         videoPlayerController.setLooping(true);
//       });
//
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return VideoPlayer(videoPlayerController);
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     // disposing videos to avoid memory leaks
//     videoPlayerController.dispose();
//     super.dispose();
//   }
// }
