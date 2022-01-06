import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/models/video.dart';
import 'package:social_media_app/services/database.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({Key? key, required this.videoOne}) : super(key: key);
  final VideosOne videoOne;

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  bool likeButtonCliked=false;
  String heart = "heart";
  String heart1 = "heart1";
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
            seconds: 5
        )
    );
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int value = int.parse(widget.videoOne.likes.toString())+1;

    TextStyle style =   Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13, color: Colors.white);
    TextStyle style1 =   Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13, color: Colors.red);
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profileImageButton(widget.videoOne.imageUrl.toString()),
          GestureDetector(
            onTap: () => {
              setState((){
                likeButtonCliked=true;
              })

            },


            child:_sideBarItem(likeButtonCliked ? heart1 : heart,
                likeButtonCliked? value.toString() : widget.videoOne.likes.toString(),
                style),
            onDoubleTap: () => {
              setState((){
                likeButtonCliked=false;
              })

            },
          ),

          _sideBarItem("comment", widget.videoOne.comments.toString(), style),
          _sideBarItem("share", "Share", style),
          AnimatedBuilder(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("assets/disk.png")
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundImage:NetworkImage(widget.videoOne.imageUrl.toString()),
                )
              ],),
            animation: _animationController, builder: (context, child){
              return Transform.rotate(angle: 2 * pi * _animationController.value,
              child: child,
              );

          },
          )
        ],
      ),
    );
  }

  _sideBarItem(String iconName, String label, TextStyle style){
    return Column(
      children: [
  SvgPicture.asset('assets/$iconName.svg'),
  SizedBox(height: 5.0,),
  Text(label, style: style,)

      ],
    );
  }

  _profileImageButton(String imageUrl){
    return Stack(
      clipBehavior: Clip.none, //check this
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl)
            )
          ),
        ),
        Positioned(
          bottom: -10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Icon(Icons.add, size: 20, color: Colors.white,),
            ))
      ],
    );
  }
}
