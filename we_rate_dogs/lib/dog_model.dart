import 'dart:async';
import 'dart:convert';

import 'dart:io';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;
  int rating = 10;

  Dog(this.name, this.location, this.description);

  Future getImageUrl() async {
    if(imageUrl != null){
      return;
    }
    HttpClient http = new HttpClient();
    try{
      Uri uri = new Uri.http("dog.ceo", '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responsebody = await response.transform(UTF8.decoder).join();
      var json = JSON.decode(responsebody);
      var url = json['message'];
      imageUrl = url;
    } catch(exception){
      print(exception);
    }
  }

}