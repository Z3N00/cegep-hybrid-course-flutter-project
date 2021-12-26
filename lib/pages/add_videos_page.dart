import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
    final TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
      fontSize: 13,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    return Container(
      color: Colors.amber,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 75, left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.pop(context)
                  },
                  child: const Icon(
                      Icons.close,
                      color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Icon(CupertinoIcons.music_note_2,
                        color: Colors.white,
                        size: 15,
                        ),
                      ),
                      Text("Add Sound", style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/ 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconWithText('flip', 'Flip', style, 20),
                      _buildIconWithText('beauty', 'Beauty', style, 20),
                      _buildIconWithText('filter', 'Filter', style, 20),
                      _buildIconWithText('flash', 'Flash', style, 20)

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

  Widget _buildIconWithText(String icon, String label, TextStyle style, double size){
    return Column(
      children: [
        SvgPicture.asset("assets/$icon.svg", height: size,),
        const SizedBox(height: 5,),
        Text(label, style: style,)
      ],
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
