

import 'package:flutter/material.dart';

import 'expert.dart';
import 'expertTimeReserved.dart';

class expert_list extends StatefulWidget {
  String token;
  expert_list({required this.token});

  @override
  State<expert_list> createState() => _expert_listState(token: token);
}

class _expert_listState extends State<expert_list> {
  String token;
  _expert_listState({required this.token});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color(0xFF880e4f),
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child:
            MaterialButton(color:const Color(0xFF880e4f),onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> expert(token:token)));},
            child: const Text("Enter your information",style: TextStyle(color:Colors.white,fontSize: 20),),),
          ),
          const SizedBox(height: 20,),
          Center(
            child:
            MaterialButton(color:const Color(0xFF880e4f),onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  expertTimeReserved(token:token)));},
              child: const Text("show Time reserved",style: TextStyle(color:Colors.white,fontSize: 20),),),
          ),
        ],
      ),
    );
  }
}
