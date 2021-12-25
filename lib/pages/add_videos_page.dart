import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddVideoPage extends StatefulWidget {
  const AddVideoPage({Key? key}) : super(key: key);

  @override
  State<AddVideoPage> createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {

  PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.2
  );
  int _selectedTab = 1;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          _buildCameraPreview(),
          const Spacer(),
          Container(
            color: Colors.black,
            height: 90,
            child: _buildCameraTemplateSelector(),
          )
        ],
      ),
    );
  }

  Widget _buildCameraPreview(){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 75, left: 24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.pop(context)
                  },
                  child: Icon(
                      Icons.close,
                      color: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.music_note_2,
                      color: Colors.white,
                      size: 15,
                      ),
                      Text("Add Sound", style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

 Widget _buildCameraTemplateSelector() {
    final List<String> postTypes = ["Camera", "Quick", "Templates"];
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 13,
        color: Colors.white,
        fontWeight: FontWeight.bold,
    );

    return Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 45,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) => {
                setState(() {
                  _selectedTab = page;
                })
              },
              itemCount: postTypes.length,
              itemBuilder: (context, index){
              return Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                child: Text(
                  postTypes[index],
                  style: style.copyWith(color: _selectedTab == index ? Colors.white : Colors.grey),
                ),
              );
            }),
          ),
          Container(
            width: 50,
            height: 45,
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 2.5,

            ),
          )
        ],
      );
  }
}
