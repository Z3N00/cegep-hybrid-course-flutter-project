import 'package:flutter/material.dart';


class AddVideoPage extends StatelessWidget {
  const AddVideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
          ),
          const Spacer(),
          Container(
            color: Colors.red,
            height: 90,
            child: _buildCameraTemplateSelector(),
          )
        ],
      ),
    );
  }

 Widget _buildCameraTemplateSelector() {
    final List<String> postTypes = ["Camera", "Quick", "Templates"];
    return Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 45,
            child: PageView.builder(
              itemCount: postTypes.length,
              itemBuilder: (context, index){
              return Container(
                width: 50,
                height: 50,
                child: Text(
                  postTypes[index]
                ),
              );
            }),
          )
        ],
      );
  }
}
