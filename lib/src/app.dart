import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'model/imageModel.dart';
import 'widegts/item_list.dart';

class App extends StatefulWidget {
 createState() {
     return AppSate();
   }

}

class AppSate extends State<App> {

int counter = 0;
List<ImageModel> imageList = [];

void fetchImage() async {
  counter++;
  var response =  await get('https://jsonplaceholder.typicode.com/photos/$counter');
  var imageModel = ImageModel.fromJSON(json.decode(response.body));
  setState(() {
  imageList.add(imageModel);    
    });
}


Widget build(context) {
  return MaterialApp(
    home: Scaffold(
      body: ImageList(imageList),
      appBar: AppBar(
        title: Text('Wanna be shown in Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
    )
  );
}

}