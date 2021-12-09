import 'package:flutter/material.dart';


class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
        backgroundColor: Colors.black54,
        body: Stack(

        children: [
        Container(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
    ),
    margin: EdgeInsets.all(20),


    child: const TextField(
    decoration: InputDecoration(
    border: InputBorder.none,
    prefixIcon: Icon(Icons.search)
    ),

    ),
    )],

    ),
    );
  }
}
