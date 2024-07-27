import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'applocal.dart';
class search_category extends StatefulWidget {

  String token;
  String searchCategory;
  search_category({required this.token,required this.searchCategory});
  @override
  State<search_category> createState() => _search_categoryState(token:token,searchCategory: searchCategory);
}

class _search_categoryState extends State<search_category> {
  String token;
  String searchCategory;
  _search_categoryState({required this.token,required this.searchCategory});
  SearchCat( ) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/category/search/${searchCategory}');
    try { print('test');
    print('searchExpert');
    http.Response response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token}' });
    var responsebody=jsonDecode(response.body);
    print(response.statusCode);
    print(responsebody);
    if(response.statusCode==200){
    //expertSearch.addAll(responsebody);
    return responsebody;}
    } catch (e) {
      print(e.toString()); }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
  backgroundColor:  Colors.indigoAccent.withOpacity(0.5),
        ),
        body: FutureBuilder(
          future:SearchCat(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.hasData){

              return ListView.builder(itemCount:snapshot.data.length ,
                  itemBuilder: (context,i){
                    if(snapshot.data!=null){
                    return Padding(
                      padding: const EdgeInsets.all(20.0),

                      child: Text(snapshot.data[i]["categories"],
                        style: const TextStyle(fontSize: 30),),

                    );}
                 else {
                      return Center(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("${getLang(context,"message Search category")} ",  style: const TextStyle(fontSize: 30),),
                   ),
                 );
                    }
                  });
            }
            else {
              return Center(child: Text("${getLang(context,"Enter name for search")}"));
            }

          },
        ));
  }
}
