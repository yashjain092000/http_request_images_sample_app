import 'package:flutter/material.dart';
import 'models/image_models.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index){
        return buildImage(images[index]);
      },
    );
  }
}

Widget buildImage(ImageModel image){
  return Container(
    padding: EdgeInsets.all(20.0),
    margin: EdgeInsets.all(20.0),
    child: Column(children: [
      Padding(child:Image.network(image.url) , padding: EdgeInsets.only(bottom: 8.0 ),),
    Text(image.title)],),
    decoration: BoxDecoration(
        border: Border.all(color:Colors.black, width: 2.0, style: BorderStyle.solid)
    ),

  );
}