import 'dart:convert';
import 'image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'HTTP REQUESTS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  List<ImageModel> images=[];

  void fetchImage() async{
    counter+=1;
  final response=await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter')); 
  final imageModel=ImageModel.fromJson(json.decode(response.body));
  setState(() {
      images.add(imageModel);
  });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
       
        child: ImageList(images)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
