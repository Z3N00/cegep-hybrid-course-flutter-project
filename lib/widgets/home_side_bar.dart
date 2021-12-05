import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSideBar extends StatelessWidget {
  const HomeSideBar({Key? key}) : super(key: key);

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
          _sideBarItem("share", "Share", style)
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
      clipBehavior: Clip.none,
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
