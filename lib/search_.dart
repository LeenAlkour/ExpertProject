import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/IndexExpert.dart';
import 'package:project1/expert_search.dart';
import 'package:project1/search_category.dart';
import 'applocal.dart';
import 'category_.dart';
import 'favoriteScreen.dart';
import 'main.dart';

class search_ extends StatefulWidget {


dynamic token;

search_({ this.token});


  @override
  State<search_> createState() => _search_State();
}

class _search_State extends State<search_> {


  dynamic token;

  _search_State({this.token});

  List experts=[];
  ShowFavorit(token ) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/showaFavorit');
    try { print('test');
    print('showaFavorit');
    http.Response response = await http.get(url,
        headers: {
          'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer ${token}' });
    var responsebody=jsonDecode(response.body);
    print(response.statusCode);
    print(responsebody);
    } catch (e) {
      print(e.toString()); } }

  Future Logout_data(token) async {

    var url = Uri.parse('http://10.0.2.2:8000/api/logout');
    try {
      print('test');


      print('$token');

      http.Response response = await http.get(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          });






      print(response.statusCode);
      print(response.body);

    } catch (e) {
      print(e.toString());
    }
    return Navigator.of(context).pushNamed("Local_login");
  }

  AccountValue( var AccountValue ,token) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/account_value');
    try {
      print('AccountValue');

      final response = await http.post(url,
          body: json.encode({
            "account_value":AccountValue,


          }),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${token}'

          });
      print(response.statusCode);
      print(response.body);
      print('kkkkkk');



    } catch (e) {
      print(e.toString());
    }


  }




  @override
  var Account_value;
  //final TextEditingController Account_value = TextEditingController();
  final TextEditingController searchExpert = TextEditingController();
  final TextEditingController searchCategory = TextEditingController();
  Widget build(BuildContext context) {
    dynamic token=ModalRoute.of(context)!.settings.arguments as dynamic;
    dynamic token1=token;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xFF880e4f),

      ),

      endDrawer:  Drawer(
        child:Column(
          children: [
         Container(height: 200,
         color: Color(0xFF880e4f).withOpacity(0.8),),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text("${getLang(context,"Favorite")}"),
              leading: const Icon(Icons.star),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  favoriteScreen(token:token)));
              }
                // Navigator.of(context).pushNamed('favoriteScreen',arguments: token1);              },
            ),
            ListTile(
              title: Text("${getLang(context,"Logout")}"),
              leading: const Icon(Icons.logout),
              onTap: () {
                Logout_data(token);},
              ),
          ],
        ) ,
      ),

      body:Center(
        child:SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${getLang(context,"welcome")}",
                style: const TextStyle(
                  fontSize: 50.0,

                  fontWeight: FontWeight.w400,
                ),

              ),
              SizedBox(
                height: 15,
              ),
              Padding(padding:const EdgeInsets.all(20.0),
                child:
                Center(
                  child:Container(

                      color: Colors.white,
                      child:
                      TextFormField(

                        controller: searchExpert,
                        onChanged: (value){
                          value=searchExpert as String;
                        },

                        decoration:  InputDecoration(
                          labelText: '${getLang(context,"Search")}',
                          border: const OutlineInputBorder(),
                          // prefixIcon: const Icon(
                          //   Icons.search,
                          // ),
                          suffixIcon:  IconButton(icon: Icon(
                            Icons.search,
                          ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> expert_search(token:token,searchExpert:searchExpert.text)));
                          },
                          ),
                        ),
                      ),
                      // MaterialButton(
                      //
                      //   height: 70.0,
                      //   onPressed: () { setState(() {
                      //
                      //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> expert_search(token:token)));
                      //   }); },
                      //   child: Row(children: [
                      //     const Icon(
                      //       Icons.search,color: Colors.white,size: 25.0,
                      //     ),
                      //     const SizedBox(
                      //       width: 20.0,
                      //     ),
                      //     Text(
                      //       '${getLang(context,"Search")}',
                      //       style: const TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 25.0,
                      //       ),
                      //     ),
                      //
                      //
                      //
                      //   ],
                      //   ),
                      // )
                  ),

                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Padding(padding:const EdgeInsets.all(20.0),
                child:

                Container(

                    color: Colors.white,
                    child:
                    TextFormField(

                      controller: searchCategory,
                      onChanged: (value){
                        value=searchCategory.text;
                      },

                      decoration:  InputDecoration(
                        labelText: '${getLang(context,"SearchC")}',
                        border: const OutlineInputBorder(),
                        // prefixIcon: const Icon(
                        //   Icons.search,
                        // ),
                        suffixIcon:  IconButton(icon: Icon(
                          Icons.search,
                        ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder:
                                (context)=> search_category(token:token,searchCategory:searchCategory.text)));
                          },
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    // MaterialButton(
                    //
                    //   height: 70.0,
                    //   onPressed: () {  },
                    //   child: Row(children: [
                    //     const Icon(
                    //       Icons.search,color: Colors.white,size: 25.0,
                    //     ),
                    //     const SizedBox(
                    //       width: 20.0,
                    //     ),
                    //     Text(
                    //       '${getLang(context,"SearchC")}',
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 25.0,
                    //       ),
                    //     ),
                    //
                    //
                    //
                    //   ],
                    //   ),
                    // )
                ),

              ),

              const SizedBox(
                width: 20.0,
              ),

              Padding(padding:const EdgeInsets.all(20.0),
                child:
                Center(
                    child:


                    MaterialButton(
                      color: Color(0xFF880e4f),

                      height: 65.0,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  category_(token:token)));
                      },
                      child: Row(children: [
                        // Icon(
                        //   Icons.search,color: Colors.white,size: 25.0,
                        // ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          '${getLang(context,"tasafouh")}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),

                        ),
                      ],
                      ),
                    )),

              ),
              Padding(padding:const EdgeInsets.all(20.0),
                child:
                Center(
                    child:


                    MaterialButton(

                      color: Color(0xFF880e4f),

                      height: 65.0,
                      onPressed: () {

                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> IndwxExpert(token:token)));
                      },
                      child: Row(children: [
                        // Icon(
                        //   Icons.search,color: Colors.white,size: 25.0,
                        // ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          '${getLang(context,"IndexExpert")}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),

                        ),
                      ],
                      ),
                    )),

              ),
              Padding(padding:const EdgeInsets.all(20.0),
                child:
                Center(
                    child:


                    MaterialButton(

                      color: Color(0xFF880e4f),

                      height: 65.0,
                      onPressed: () {
                        showModalBottomSheet(context: context, builder: (context){
                          return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                            height: 250,

                            child:Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: TextFormField(

                                    //controller:Account_value ,
                                    onChanged: (value){
                                      Account_value=value;
                                    },
                                    decoration:  InputDecoration(
                                      labelText: '${getLang(context,"Account value")}',
                                      border: const OutlineInputBorder(),


                                    ),

                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MaterialButton(onPressed: (){
                                  setState(() {
                                    AccountValue(Account_value,token);

                                  });

                                },
                                  color:Color(0xFF880e4f),
                                  child: Text('${getLang(context,"pay")}',style: TextStyle(color: Colors.white),),
                                ),

                              ],
                            ) ,);
                        } );},
                      child: Row(children: [
                        // Icon(
                        //   Icons.search,color: Colors.white,size: 25.0,
                        // ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          '${getLang(context,"Account value")}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),

                        ),
                      ],
                      ),
                    )),

              ),



            ],

          ),
        ),
      ),
    );

  }
}
















