import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/models/video.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

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
    TextStyle style =   Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _profileImageButton(widget.video.postedBy.profileimageUrl),
          _sideBarItem('heart', widget.video.likes, style),
          _sideBarItem("comment", widget.video.comments, style),
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
                  backgroundImage:NetworkImage(widget.video.postedBy.profileimageUrl),
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
