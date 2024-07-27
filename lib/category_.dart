import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/search_category.dart';
import 'package:project1/shwo_expert_from_.dart';
import 'applocal.dart';
import 'category_.dart';
import 'favoriteScreen.dart';
import 'main.dart';

class category_ extends StatefulWidget {
  String token;
  category_({Key? key, required this.token}) : super(key: key);
  @override
  State<category_> createState() => _category_State(token: token);
}

class _category_State extends State<category_> {
  String token;
  _category_State({required this.token});
  @override

  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(

          backgroundColor: Colors.indigoAccent.withOpacity(0.5),
          title:  Text('${getLang(context,"Consulting")}')
      ),

      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap:(){
                          int idCategory=1;
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  shwo_expert_from_(token:token,idCategory:idCategory)));
                        });
                        },


                        child: Container(
                          child: Column(
                            children: [
                              const Image(
                                image: const AssetImage('images/psychological Counseling.png'),
                                width:180.0,
                                height: 180.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text('${getLang(context,"psychological Counseling")}'),

                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap:(){



                          setState(() {
                            int idCategory=2;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  shwo_expert_from_(token:token,idCategory:idCategory)));
                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                              const Image(
                                image: const AssetImage('images/Business consulting And management.png'),
                                width:180.0,
                                height: 180.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text('${getLang(context,"Business consulting And management")}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap:(){

                          setState(() {int idCategory=3;
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  shwo_expert_from_(token:token,idCategory:idCategory)));
                          });

                          });

                        },
                        child: Container(
                          child: Column(
                            children: [
                              const Image(
                                image: const AssetImage('images/Medical consultation.png'),
                                width:180.0,
                                height: 180.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text('${getLang(context,"Medical consultation")}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),

                  ],
                ),


              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap:(){



                          setState(() {
                           int  idCategory=4;
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  shwo_expert_from_(token:token,idCategory:idCategory)));
                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                              const Image(
                                image: const AssetImage('images/Career Counseling.png'),
                                width:180.0,
                                height: 180.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text('${getLang(context,"Career Counseling")}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap:(){



                          setState(() {
                            int idCategory=5;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  shwo_expert_from_(token:token,idCategory:idCategory)));

                          });
                        },
                        child: Container(
                          child: Column(
                            children: [
                              const Image(
                                image: const AssetImage('images/Family counseling.png'),
                                width:180.0,
                                height: 180.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text('${getLang(context,"Family counseling")}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ),
            ],
          )

        ],
      ),
    );
  }
}
