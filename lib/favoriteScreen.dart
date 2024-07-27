import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class favoriteScreen extends StatefulWidget {
  String token;

  favoriteScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<favoriteScreen> createState() => _favoriteScreenState(token:token);
}

class _favoriteScreenState extends State<favoriteScreen> {
  String token;

  _favoriteScreenState({required this.token});



  @override



    Future showFavorit() async {
      var url = Uri.parse('http://10.0.2.2:8000/api/showFavorit/');
      try {
        print('showFavorit');
        print('${token}');
        http.Response response = await http.get(url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${token}' });


        var responsebody = jsonDecode(response.body);
        print(response.statusCode);
        return responsebody['data'];
      } catch (e) {
        print(e.toString());
      }
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
backgroundColor:  Colors.indigoAccent.withOpacity(0.5),
          ),
          body: FutureBuilder(
            future:showFavorit(),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.hasData){

                return ListView.builder(itemCount:snapshot.data.length ,
                    itemBuilder: (context,i){
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 50,
                          decoration:BoxDecoration(borderRadius: BorderRadius.circular(2.0),),
                          child:
                          Text(snapshot.data[i]["name"],style: TextStyle(fontSize: 30),),),

                      );

                    });
              }
              else
                return Center(child: CircularProgressIndicator());

            },
          ));;
    }
  }

