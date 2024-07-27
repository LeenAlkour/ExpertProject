
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:http/http.dart' as http;
import 'applocal.dart';

class profile extends StatefulWidget {
 String token;
 var id;
 profile({required this.token,this.id});
  @override
  State<profile> createState() => _profileState(token: token,id:id);
}


class _profileState extends State<profile> {
  String token;
  var id;

  _profileState({required this.token,this.id });
  late String name;
   late String Experiences;
  late String address;
  late var Phone_number;
  late var ide;
  late List categories;
  late List times;
  late var idTime;
  late int rate;
  ExpertProfile() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/expertProfile/$id');
    try {
      print('test');
      print('ExpertProfile');
      http.Response response = await http.get(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token' });
      var responsebody=jsonDecode(response.body);
      print(response.statusCode);
      print(responsebody);
      return[
        name=responsebody["expert"]["name"],
        Experiences=responsebody["expert"]["Experiences"],
        address=responsebody["expert"]["address"],
        Phone_number=responsebody["expert"]["Phone_number"],
        categories= responsebody["categories"],
        ide=responsebody["expert"]["id"],
        rate=responsebody["rates"]["rate"],


      ];
    }
    catch (e) {
      print(e.toString()); } }
  AddToFavorit() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/addToFavorit/$id');
    try { print('test'); print('AddToFavorit');
    http.Response response = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token' });
    var responsebody=jsonDecode(response.body);
    print(response.statusCode); print(responsebody);
    } catch (e) { print(e.toString()); } }
  AvailableTimeShow() async {
    var url = Uri.parse('http://10.0.2.2:8000/api/available_times/show/$id');
    try { print('test'); print('AvailableTimeShow');
    http.Response response = await http.get(url,
        headers: { 'Content-Type': 'application/json', 'Accept': 'application/json',
          'Authorization': 'Bearer $token' });
    var responsebody=jsonDecode(response.body);
    print(response.statusCode);
    print(responsebody);
   times=responsebody["data"];

   return
     showModalBottomSheet(context: context, builder: (context){
       return Padding(
         padding: const EdgeInsets.all(20.0),
         child: SingleChildScrollView(
           child: Container(child:Column(
             children: [
               for (var prop in times)

                 GestureDetector(
                   onTap: (){
                       idTime=prop["id"];
                       print(idTime);
                   },
                   child: Text("${prop["available_times"]} - ${ prop["id"]}",maxLines: 1,
                     overflow: TextOverflow.ellipsis,style: const TextStyle(color: Colors.black,
                         fontSize: 25.0,
                         inherit: false),),
                 ),
               const SizedBox(
                 height: 10,
               ),
               MaterialButton(onPressed: (){
                 Reserve(idTime);
//
               },
                 color: const Color(0xFF880e4f),
                 child: Text('${getLang(context,"pay")}',style: const TextStyle(color: Colors.white,)),
               )],
           ) ,),
         ),
       );
     } );
    } catch (e) { print(e.toString()); } }
  Reserve(var idTime) async {

    var url = Uri.parse('http://10.0.2.2:8000/api/reserve/$idTime');
    try {
      print('test');
      print('Reserve');
      final response = await http.post(url,
          headers: { 'Content-Type': 'application/json',
            'Accept': 'application/json',
                'Authorization': 'Bearer $token'});
      var responsebody = jsonDecode(response.body);
      print(response.statusCode);
      print(responsebody);
    } catch (e) {
      print(e.toString());
    }
  }
  Evaluation( ) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/expert/evaluation');
    try { print('test'); print('Evaluation');
    final response = await http.post(url,
        body: json.encode({
          'id':id,
          'rate':rating }),
        headers: { 'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token' });
    var responsebody=jsonDecode(response.body);
    print(response.statusCode);
    print(responsebody); }
    catch (e) { print(e.toString()); } }

  @override
  void initState() {
  ExpertProfile();
    super.initState();
  }
  double rating=0;
  @override
  Widget build(BuildContext context) {
    // String name='test';
    int rating=0;
    setState(() {
      ExpertProfile();
    });
    // String Experiences='test11';
    dynamic idExpert=ModalRoute.of(context)!.settings.arguments as dynamic;




    Widget buildRating()=>RatingBar.builder(
      minRating:1, itemSize:46,
      itemPadding:EdgeInsets.symmetric(horizontal:4),
      itemBuilder:(context ,_)=>
          Icon(Icons.star,color:Colors.amber),
      updateOnDrag:true,
      onRatingUpdate:(Rating)=>
        setState((){
          this.rating=Rating as double;
        }), );
    return Scaffold(
      floatingActionButton: SpeedDial(animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: Colors.white,buttonSize:const Size(60.0, 60.0) ,
        foregroundColor: const Color(0xFF880e4f),elevation: 150,
      children: [
        SpeedDialChild(
          onTap: (){ AvailableTimeShow();
          },
            backgroundColor: const Color(0xFF880e4f),
          child: const Icon(Icons.wrap_text,color: Colors.white,),
          label: "${getLang(context,"Book an Appointment")}"
        ),
        SpeedDialChild(
          onTap:() {

            void showRating()=>showDialog(
              context:context,
              builder:(context)=>AlertDialog(
                title:Text('Rate This Expert'),
                content: Column(

                    mainAxisSize:MainAxisSize.min,
                    children:[
                      Text('Pleasleave astar rating',
                        style:TextStyle(fontSize:20,),),
                      SizedBox(height:32),
                      buildRating(),
                    ] ),
                actions:[
                  TextButton(
                      child:Text('ok',
                        style:TextStyle(fontSize:20),), onPressed:(){Navigator.pop(context);
                  Evaluation();}
                  ),], ), );
            showRating();

           },



          backgroundColor: const Color(0xFF880e4f),
            child: const Icon(Icons.star,color: Colors.white,),
            label: "${getLang(context,"Rate this expert")}"
        ),
        SpeedDialChild(
          onTap: (){
            AddToFavorit();
          },
            backgroundColor: const Color(0xFF880e4f),
            child: const Icon(Icons.add,color: Colors.white,),
            label: "${getLang(context,"Add to favourites")}"
        )
      ],),

      body: Container(
        color:  Colors.indigoAccent.withOpacity(0.5),
        child:Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(
                  height: 30.0,
                ),
                 const CircleAvatar(
                  radius: 60,
                   backgroundColor: Color(0xFF880e4f),

                ),

                 Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("$name",
                    style: const TextStyle(color: Colors.black,
                  fontSize: 30.0,
                  inherit: false),),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(width: double.infinity,


                    child: Center(
                      child: Text("${getLang(context,"Rate")} : $rate  ",
                        style: const TextStyle(color: Colors.black,
                            fontSize: 25.0,
                            inherit: false),),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(width: double.infinity,


                          child:  Center(
                            child: Text("$Experiences",
                              style: const TextStyle(color: Colors.black,
                                  fontSize: 25.0,
                                  inherit: false),),
                          ),),
                ),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(width: double.infinity,


                    child: Center(
                      child: Text("${getLang(context,"Address")} : $address  ",style: const TextStyle(color: Colors.black,
                          fontSize: 25.0,
                          inherit: false),),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(width: double.infinity,


                    child:  Center(
                      child: Text("${getLang(context,"Phone_number")}:$Phone_number",style: const TextStyle(color: Colors.black,
                          fontSize: 25.0,
                          inherit: false),),
                    ),),
                ),
                Text("${getLang(context,"categories")}:",style: const TextStyle(color: Colors.black,
                    fontSize: 25.0,
                    inherit: false),),
                for (var prop in categories)
              Column(

                children: [
                  Text("${prop["categories"]}",maxLines: 1,
                    overflow: TextOverflow.ellipsis,style: const TextStyle(color: Colors.black,
                      fontSize: 25.0,
                      inherit: false),),
                ],
              ),


    // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Container(width: double.infinity,
                //
                //
                //     child: const Center(
                //       child: Text("الاستشارات : الاستشارات النفسية",style: TextStyle(color: Colors.black,
                //           fontSize: 20.0,
                //           inherit: false),),
                //     ),),
                // ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}







// void showRating()=> shwoDialog(
//   context:context,
//   builder:(context)=>AlertDialog(
//     title:Text('Rate This Expert'),
//     content: Column(
//       crossAxisAlignment:CrossAxisAlignment,
//       mainAxisSIze:MainAxisSize.min,
//       children:[
//         Text('Pleasleave astar rating',
//       style:TextStyle(fontSize:20,),
//       const SizedBox(height:32), ], ),
//     actions:[ TextButton(
//         child:Text('ok',
//           style:TextStyle(fontSize:20),),
//         onPressed:()=>Navigator.pop), ], ), );
//   Widget buildRating()!>RatingBar.builder(
// minRating:1, itemSize:46,
// itemPadding:EdgeInsets.symmetric(horizontal:4),
// itemBuilder:(context ,_)=>Icon(Icons.star,color:Colors.amber),
// updateOnDrag:true,
// onRatingUpdate:(rating)=>setState((){ this.rating=rating; }), );




// showModalBottomSheet(context: context, builder: (context){
// return Container(
// decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
// height: 250,
//
// child:Column(
// children: [
// const SizedBox(
// height: 20,
// ),
// Padding(
// padding: const EdgeInsets.all(20.0),
// child: TextFormField(
//
// //controller:Account_value ,
// onChanged: (value){
//
// },
// decoration:  InputDecoration(
// labelText: '${getLang(context,"Account_value")}',
// border: const OutlineInputBorder(),
//
//
// ),
//
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// MaterialButton(onPressed: (){
//
//
//
//
//
// },
// color:const Color(0xFF880e4f),
// child: Text('${getLang(context,"pay")}'),
// ),
// ],
// ) ,);
// } );