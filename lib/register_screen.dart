// ignore_for_file: camel_case_types
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project1/Local_login.dart';
import 'package:project1/expert.dart';
import 'package:project1/main.dart';
import 'package:project1/search_.dart';

import 'applocal.dart';
import 'category_.dart';
// import 'dart:convert';
// import 'Local_login.dart';


class Register_Screen extends StatefulWidget {

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {

   late dynamic exp =true;

  List users = [];

  // Database databasecontrol1=Database();
  final TextEditingController _emailController1 = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _c_passwordController = TextEditingController();
  TextEditingController _typeController = TextEditingController();

  @override


  // void initState() {
  //   registerData(_nameController.text, _emailController1.text,
  //       _passwordController1.text,_c_passwordController.text);
  //
  //   super.initState();
  // }
late var expn;

  @override
  void initState() {

    //search_(id_user:id_user, Token: Token,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    registerData(String name, String email, String password, String c_password,int expn) async {
      var url = Uri.parse('http://10.0.2.2:8000/api/register');
      try {
        print('test');
        print(_nameController.text);
        final response = await http.post(url,
            body: json.encode({
              "name": _nameController.text,
              "email": _emailController1.text,
              "password": _passwordController1.text,
              "c_password": _c_passwordController.text,

                "type":expn ,
            }),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            });
        print(response.statusCode);
        print(response.body);
        var responsebody = jsonDecode(response.body);
        token=responsebody['data']['token'];
         return   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Local_login()));

      } catch (e) {
        print(e.toString());
      }

      // var responsebody=jsonDecode(response.body);
      // print(responsebody);
    }
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
                  '${getLang(context,"Register")}',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: '${getLang(context,"name")}',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.drive_file_rename_outline,
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: _emailController1,
                  decoration:  InputDecoration(
                    labelText: '${getLang(context,"Email Address")}',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: _passwordController1,
                  obscureText: true,
                  decoration:  InputDecoration(
                    labelText: '${getLang(context,"password")}',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: _c_passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '${getLang(context,"C_Password")}',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            exp = true;


                          });
                          expn=1;
                        },
                        child: Container(
                          height: 40.0,
                          color: exp ? Color(0xFF880e4f) : Colors.grey,

                          child:  Center(
                            child: Text(
                              '${getLang(context,"Expert")}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            exp = false;

                          });
                          expn=0;
                        },
                        child: Container(
                          height: 40.0,
                          color: exp ? Colors.grey : Color(0xFF880e4f),
                          child:  Center(
                            child: Text(
                              "${getLang(context,"User")}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),

                Container(
                  color: Color(0xFF880e4f),
                  width: double.infinity,
                  child: MaterialButton(
                    height: 40,
                    onPressed: () {
                      // if(exp==false){
                      //   Navigator.of(context).pushNamed("search_");}
                      // else Navigator.of(context).pushNamed("");

                      registerData(_nameController.text, _emailController1.text,
                          _passwordController1.text,
                          _c_passwordController.text,expn);



                      //
                    },
                    child:  Text(
                      '${getLang(context,"Register")}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
