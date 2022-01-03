import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:social_media_app/_mock_data/mock.dart';
//import 'package:social_media_app/_mock_data/mock.dart';
import 'package:social_media_app/models/video.dart';
import 'package:social_media_app/services/database.dart';


class VideoDetail extends StatelessWidget {
  final VideosOne videosOne;
  const VideoDetail({Key? key,  required this.videosOne}) : super(key: key);
  //final Video video;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("@${videosOne.username}",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 15,
              color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          ExpandableText(videosOne.caption.toString(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
              expandText: "more",
              collapseText: "less",
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 2,
            linkColor: Colors.grey,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children:  [
              const Icon(
                CupertinoIcons.music_note_2,
                size: 15,
                color: Colors.white,
              ),
              const SizedBox(width: 8.0,),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width/2,
                child: Marquee(
                  text: "${videosOne.audio}   *    ",
                  velocity: 8,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
