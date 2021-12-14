import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.selectedPageIndex, required this.onIconTap}) : super(key: key);
  final int selectedPageIndex;
  final Function onIconTap;
  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.06;
    final style =  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10, fontWeight: FontWeight.w600);
    return BottomAppBar(

        color: selectedPageIndex == 0 ? Colors.black : Colors.white,
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _bottombarNavitem(0, 'Home', style, 'icons8-home'),
            _bottombarNavitem(1, 'Discover', style, 'icons8-binoculars'),
           _addVideoNavItem(barHeight),

            _bottombarNavitem(3, 'Inbox', style, 'icons8-mailbox'),
            _bottombarNavitem(4, 'Profile', style, 'icons8-user-male')
          ],
        ),
      ),
    );
  }

  _bottombarNavitem(int index, String label, TextStyle textStyle, String iconName){
    bool isSelected = selectedPageIndex == index;



    return GestureDetector(
      onTap: () => {onIconTap(index)},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

        SvgPicture.asset('assets/$iconName.svg' ),
        const SizedBox(height: 3),
        //Text(label, style: textStyle.copyWith(color: iconAndTextColor),)
      ],),
    );
  }

  _addVideoNavItem(double height){
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      height: height - 15,
      width: 48,


      child: Center(
        child: Container(

          child:SvgPicture.asset('assets/icons8-instagram-old.svg' ),



        ),
      ),
    );
  }
}
