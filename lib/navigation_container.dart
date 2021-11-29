import 'package:flutter/material.dart';
import 'package:social_media_app/pages/add_videos_page.dart';
import 'package:social_media_app/pages/discover_page.dart';
import 'package:social_media_app/pages/home_page.dart';
import 'package:social_media_app/pages/inbox_page.dart';
import 'package:social_media_app/pages/profile_page.dart';
import 'package:social_media_app/widgets/custom_bottom_navigation_bar.dart';


class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  _NavigationContainerState createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectPageIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    DiscoverPage(),
    AddVideoPage(),
    InboxPage(),
    ProfilePage()
  ];

  void _onIconTapped(int index){
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectPageIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedPageIndex: _selectPageIndex, onIconTap: _onIconTapped),
      );
  }
}
