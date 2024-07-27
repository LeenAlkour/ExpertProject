import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class expertTimeReserved extends StatefulWidget {
String token;
expertTimeReserved({required this.token});
  @override
  State<expertTimeReserved> createState() => _expertTimeReservedState(token: token);
}

class _expertTimeReservedState extends State<expertTimeReserved> {
  String token;
  _expertTimeReservedState({required this.token});
  Future reserved_times() async {
//print(id_Category);
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/reserved_times/show');
    try {
      print('test');
      print('reserved_times');
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
            future:reserved_times(),
            builder: (BuildContext context,AsyncSnapshot snapshot){
              if(snapshot.hasData){

                return ListView.builder(itemCount:snapshot.data.length ,
                    itemBuilder: (context,i){
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(

                          height: 70,
                          decoration:BoxDecoration(color:Colors.grey.withOpacity(0.2),borderRadius: BorderRadius.circular(2.0),),
                          child:
                      Center(child: Text(snapshot.data[i]["reserved_times"],style: TextStyle(fontSize: 30),)),
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


