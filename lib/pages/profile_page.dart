


import 'package:flutter/material.dart';
import 'package:social_media_app/_mock_data/mock.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,


      appBar: PreferredSize(
          child: appBar(),
          preferredSize: Size.fromHeight(180)),
      body: Body(context),

    );
  }

  Widget appBar() {
    return AppBar(elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.black)
              ),
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(37),
                      image: DecorationImage(
                          image:NetworkImage("https://picsum.photos/id/1062/400/400"),
                          fit: BoxFit.cover)
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Inderpreet Singh",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black,),),
            SizedBox(height: 10,),
            Text("@inder431", style: TextStyle(fontSize: 16,color: Colors.black,),),
          ],
        ),
      ),
    );
  }

  Widget Body(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(

      child: Column(
        children: [
          SizedBox(height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Posts",
                      style: TextStyle(fontSize: 15, color: Colors.black)
                  ),
                  SizedBox(height: 8,),
                  Text("8", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Followers",
                      style: TextStyle(fontSize: 15, color: Colors.black)
                  ),
                  SizedBox(height: 8,),
                  Text("565", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Following",
                      style: TextStyle(fontSize: 15, color: Colors.black)
                  ),
                  SizedBox(height: 8,),
                  Text("15", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30,
          ),

          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: List.generate(imgList.length, (index){
              return Container(
                width: (size.width-60)/2,
                height: (size.width-60)/2,
                decoration: BoxDecoration(image: DecorationImage(
                    image:NetworkImage(imgList[index]),
                    fit: BoxFit.cover)),
                child: Center(
                  child: Icon(Icons.play_circle_outline,size: 40,color: Colors.white),

                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
