import 'package:flutter/material.dart';
import 'package:social_media_app/models/video.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  const VideoTile({Key? key, required this.video, required this.snappedPageIndex, required this.currentIndex}) : super(key: key);
  final Video video;
  final int snappedPageIndex;
  final int currentIndex;


  @override
  _VideoTileState createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {

  late VideoPlayerController _videoPlayerController;
  late Future _initializeVideoPlayer;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset("assets/${widget.video.videoUrl}");
    _initializeVideoPlayer = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
      setState(() {
      //  _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
      });

    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _videoPlayerController.dispose();
    super.dispose();
  }


  void _pausePlayVideo() {

   _isVideoPlaying ? _videoPlayerController.pause() : _videoPlayerController.play();
   _isVideoPlaying = false;
    // if(_isVideoPlaying == true){
    //   _videoPlayerController.pause();
    // }else{
    //   _videoPlayerController.play();
    // }
    // setState((){
    //   _isVideoPlaying = !_isVideoPlaying;
    // });
  }

  @override
  Widget build(BuildContext context) {
    (widget.snappedPageIndex == widget.currentIndex) ? _videoPlayerController.play() : _videoPlayerController.pause();
    return Container(
      color: Colors.black,
      child: FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return GestureDetector(
              onTap: () => {
               _pausePlayVideo()
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                    VideoPlayer(_videoPlayerController),
                    IconButton(
                        onPressed: ()=>{
                          _pausePlayVideo()
                        },
                        icon: Icon(
                          Icons.play_arrow,
                          color: Colors.white.withOpacity(_isVideoPlaying ? 0 : 0.5),
                          size: 60,
                        ))
                  ]
              ),
            );
          }else {
            return Container(
              color: Colors.black,
            );
          }

        }

      ),
    );
  }
}
