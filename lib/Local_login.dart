
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/applocal.dart';
import 'package:project1/expert.dart';
import 'package:project1/main.dart';
import 'package:project1/register_screen.dart';
import 'package:project1/search_.dart';

import 'category_.dart';
import 'expert_list.dart';


class Local_login extends StatefulWidget {
  const Local_login({Key? key}) : super(key: key);

  @override
// File image;
//   final imagepickar=ImagePicker();
//   upLoadImage(){
//     var pickedImage=imagepickar.getImage(source: ImageSource.camera);camera
  //}
  State<Local_login> createState() => _Local_loginState();

}

bool exp=true;

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();


class _Local_loginState extends State<Local_login> {

  @override
  void initState() {

    super.initState();
  }
    late String token;
  late var type;
  @override

  Widget build(BuildContext context) {

    dynamic exp=ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF880e4f),

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "${getLang(context,"login")}",
                  style: const TextStyle(
                    fontSize: 50.0,

                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: emailController,
                  decoration:  InputDecoration(
                    labelText: '${getLang(context,"Email Address")}',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                  ),

                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration:  InputDecoration(
                    labelText: '${getLang(context,"password")}',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(

                  width: double.infinity,
                  color: Color(0xFF880e4f),
                  child: MaterialButton(
                    height: 40,
                    onPressed: () {
                    loginData(emailController.text,passwordController.text);
                   // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> search_(token:token)));

                     // ));

    },
                    child:  Text('${getLang(context,"login")}',
                      style: const TextStyle(color: Colors.white,
                        fontSize: 25.0,

                      ),
                    ),

                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '${getLang(context,"Don't have an account?")}'
                    ),
                    TextButton(onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Register_Screen()));


                    },
                      child:  Text('${getLang(context,"Register Now")}'),)
                  ],
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }



   loginData( String email, String password) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/login');
    try {
      print('test');

      final response = await http.post(url,
          body: json.encode({
            "email": emailController.text,
            "password": passwordController.text,

          }),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      print(response.statusCode);
      print(response.body);
      var responsebody = jsonDecode(response.body);
      token=responsebody['data']['token'];
      type=responsebody['data']['type'];
      print(token);
      print(type);
if(type==1) {
  return  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  expert_list(token:token)));
} else {
  return Navigator.of(context).pushNamed('search_',arguments: token);
}
    } catch (e) {
      print(e.toString());
    }


  }}
