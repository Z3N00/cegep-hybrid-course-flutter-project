import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({Key? key}) : super(key: key);

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
          _profileImageButton(),
          _sideBarItem('heart', '1.2M', style),
          _sideBarItem("comment", "1.2k", style),
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
                const CircleAvatar(
                  radius: 12,
                  backgroundImage:NetworkImage('https://picsum.photos/id/1062/400/400'),
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

  _profileImageButton(){
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
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/id/1062/400/400')
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
