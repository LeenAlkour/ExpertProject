import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class IndwxExpert extends StatefulWidget {
String token;
IndwxExpert({required this.token});

  @override
  State<IndwxExpert> createState() => _IndwxExpertState(token: token);
}

class _IndwxExpertState extends State<IndwxExpert> {
  String token;
  _IndwxExpertState({required this.token});

  ExpertsIndex() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/experts/index');
    try { print('test');
    print('ExpertsIndex');
    http.Response response = await http.get(url,
        headers: { 'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}' });
    var responsebody=jsonDecode(response.body);
    print(response.statusCode);
    return responsebody["data"];
    print(responsebody); } catch (e) {
      print(e.toString()); } }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF880e4f),

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future:ExpertsIndex() ,
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
                              onPressed: () {  },
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
