import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.selectedPageIndex, required this.onIconTap}) : super(key: key);
  final int selectedPageIndex;
  final Function onIconTap;
  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.06;
    return BottomAppBar(
      child: Container(
        height: barHeight,
        child: Row(
          children: [_bottombarNavitem(0, 'Home', TextStyle(), 'home')],
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

    return Column(children: [
      SvgPicture.asset('assets/${isSelected ? iconName + '_filled' : iconName}.svg'),
      const SizedBox(height: 3,),
      Text(label, style: textStyle.copyWith(color: iconAndTextColor),)
    ],);
  }

}
