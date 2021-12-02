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
            _bottombarNavitem(0, 'Home', style, 'home'),
            _bottombarNavitem(1, 'Discover', style, 'search'),
            _bottombarNavitem(3, 'Inbox', style, 'message'),
            _bottombarNavitem(4, 'Profile', style, 'account')
          ],
        ),
      ),
    );
  }

  _bottombarNavitem(int index, String label, TextStyle textStyle, String iconName){

    bool isSelected = selectedPageIndex == index;
    Color iconAndTextColor = isSelected ? Colors.black : Colors.grey;

    if(isSelected && selectedPageIndex == 0){
      iconAndTextColor = Colors.grey;
    }

    return GestureDetector(
      onTap: () => {onIconTap(index)},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        SvgPicture.asset('assets/${isSelected ? iconName + '_filled' : iconName}.svg', color: iconAndTextColor,),
        //const SizedBox(height: 1),
        Text(label, style: textStyle.copyWith(color: iconAndTextColor),)
      ],),
    );
  }

}
