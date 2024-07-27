
import 'dart:convert';
import 'package:project1/profile.dart';
import 'package:project1/register_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project1/applocal.dart';
class shwo_expert_from_ extends StatefulWidget {
  var idCategory;
String token;
  shwo_expert_from_({
    required this.token,
    this.idCategory
});
  @override
  State<shwo_expert_from_> createState() => _shwo_expert_from_State(token: token,idCategory: idCategory);
}

class _shwo_expert_from_State extends State<shwo_expert_from_> {

var idCategory;

String token;

_shwo_expert_from_State({
  required this.token,
  this.idCategory
});
  Future CategoryShow() async {
//print(id_Category);
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/category/show/${idCategory}');
    try {
      print('test');
      print('CategoryShow');
      http.Response response = await http.get(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${token}'});
      var responsebody = jsonDecode(response.body);
      print(response.statusCode);
      print(responsebody);
      return responsebody["data"];


    }
    catch (e) {
      print(e.toString());
    }
  }

  @override

    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF880e4f),

          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future:CategoryShow(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.hasData){

                  return ListView.builder(itemCount:snapshot.data.length ,
                      itemBuilder: (context,i){
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(

                            height: 50,
                            decoration:BoxDecoration(color:Colors.grey.withOpacity(0.2),borderRadius: BorderRadius.circular(2.0),),
                            child:
                            MaterialButton(
                                onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  profile(token:token,id:snapshot.data[i]["id"]))); },
                                child: Text(snapshot.data[i]["name"],style: TextStyle(fontSize: 30),)),
                          ),

                        );

                      });
                }
                else
                  return Center(child: CircularProgressIndicator());

              },
            ),
          ));
    }

  }

