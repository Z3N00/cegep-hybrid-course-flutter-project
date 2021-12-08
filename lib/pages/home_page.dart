import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/_mock_data/mock.dart';
import 'package:social_media_app/models/video.dart';
import 'package:social_media_app/widgets/home_side_bar.dart';
import 'package:social_media_app/widgets/video_detail.dart';
import 'package:social_media_app/widgets/video_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isFollowingSelected = true;
  int _snappedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:  [
            GestureDetector(
              onTap: () => {
                setState(() {
                  _isFollowingSelected = true;
                })
              },
              child: Text("Following",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: _isFollowingSelected ? 18 : 15, color: _isFollowingSelected ? Colors.white : Colors.grey)),
            ),
            Text("  |  ", style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.grey),),
            GestureDetector(
              onTap: () => {
                setState(() {
                  _isFollowingSelected = false;
                })
              },
              child: Text("For You",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: !_isFollowingSelected ? 18:15, color: !_isFollowingSelected ? Colors.white: Colors.grey)),
            )
          ],
        ),
      ),
      body: PageView.builder(
        onPageChanged: (int page)=>{
         // print("page changed to $page"),
          setState(() {
            _snappedPageIndex = page;
          }),
        },
        scrollDirection: Axis.horizontal,
        itemCount: videos.length,
        itemBuilder: (context, index){
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            VideoTile(
                video: videos[index],
                currentIndex: index,
                snappedPageIndex: _snappedPageIndex,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      //color: Colors.amber,
                      child: VideoDetail(video: videos[index],),
                    )
                ),
                Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.75,
                      child: HomeSideBar(video: videos[index],),
                     // color: Colors.pink,
                    )
                ),
              ],
            )
          ],
        );
      }

      )
    );
  }
}
