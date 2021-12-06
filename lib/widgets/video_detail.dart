import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';


class VideoDetail extends StatefulWidget {
  const VideoDetail({Key? key}) : super(key: key);

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("@yeah_yes", style:
        Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 15,
            color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        ExpandableText("Video Caption goes here Video Caption goes here Video Caption goes here Video Caption goes here Video Caption goes here Video Caption goes here Video Caption goes here Video Caption goes here Video Caption goes here",
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
      ],
    );
  }
}
