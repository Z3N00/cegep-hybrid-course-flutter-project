import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.selectedPageIndex, required this.onIconTap}) : super(key: key);
  final int selectedPageIndex;
  final Function onIconTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
