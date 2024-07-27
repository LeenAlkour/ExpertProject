
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/expertTimeReserved.dart';
import 'applocal.dart';

// ignore: camel_case_types
class expert extends StatefulWidget {
  String token;

  expert({required this.token});
  @override
  State<expert> createState() => _expertState(token: token);
}
final TextEditingController name1 = TextEditingController();

final TextEditingController Address = TextEditingController();
class _expertState extends State<expert> {
  String token;
  _expertState({required this.token});

late File image_=File("C:\Users\lenovo\project1\images\Career Counseling.png");
  var  image;
  final imagepicker=ImagePicker();
   uploadImage()async{
    var pickedImage=await imagepicker.getImage(source:ImageSource.camera);
    if(pickedImage!=null){setState((){
      image=File(pickedImage.path);
      path=image.path;
    });
    }else{}
 }




  DateTime dateTime=DateTime(2002,0,0,0,0);
  DateTime dateTime1=DateTime(2002,0,0,0,0);
  DateTime dateTime2=DateTime(2002,0,0,0,0);
  bool family=true;
  bool career=true;
  bool pys=true;
  bool mang=true;
  bool mid=true;

  late int pys1;
 late int mang1;
  late int mid1;
  late int career1;
  late int family1;
  late var path;
  @override

  Widget build(BuildContext context) {
    final hours=dateTime.hour.toString().padLeft(2,'0');
    final minutes=dateTime.minute.toString().padLeft(2,'0');
    final second=dateTime.second.toString().padLeft(2,'0');
    List TimeIndex;
    List CategoryIndex;
    setState(() {
      //String imegePath=image.path;
    });
late int price;
late int num;
List cat=[];
    final TextEditingController ExperiencesController = TextEditingController();
    final TextEditingController EAddressController = TextEditingController();
    final TextEditingController numController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
List Ctegory=[];
    expertRegistert(
        ) async {
      var url = Uri.parse('http://10.0.2.2:8000/api/expertRegistert');
      try {
        print('test');

        final response = await http.post(url,
            body: json.encode({



              "Experiences": ExperiencesController.text,
              "price":priceController.text ,
              "Phone_number":numController.text,
              "address":EAddressController.text,
              "times":[dateTime1.toString(),dateTime.toString(),dateTime2.toString()],
              "category":[1,2,3,4,5]


            }),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization':'Bearer ${token}'
            });
        print(response.statusCode);
        print(response.body);
        var responsebody = jsonDecode(response.body);


        return   Navigator.pop(context);
      } catch (e) {
        print(e.toString());
      }

      // var responsebody=jsonDecode(response.body);
      // print(responsebody);
    }


    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [

               // if (image==null) const Text("looo") else Image.file(image),
                Column(
                  children: [
                    if (image==null) Text("enter photo")
                    else
                      Center(child: Container(width:200,height: 200,child: Image.file(image))),

                    MaterialButton(onPressed: (){
                      uploadImage();




                      // image==null ?  Text("looo"): Image.file(image);
                    }, child:  Icon(Icons.camera,size: 30,),),

                  ],
                ),
                // Text(image.path),



                // imageProfile(),

               // Image.file(image),
               // Text('${image.path}'),

                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(

                    controller: ExperiencesController,
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF880e4f),)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF880e4f),
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                            color:Color(0xFF880e4f),
                          )),
                      labelText: '${getLang(context,"Experiences")}',

                      prefixIcon: const Icon(
                        Icons.drive_file_rename_outline,color: const Color(0xFF880e4f),
                      ),

                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                   controller: numController,

                    decoration:  InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF880e4f),
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                            color:Color(0xFF880e4f),
                          )),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF880e4f),)),
                      labelText: '${getLang(context,"Phone_number")}',

                      prefixIcon: const Icon(
                        Icons.phone,color:Color(0xFF880e4f),
                      ),

                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),

                Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: EAddressController,

                    decoration:  InputDecoration(

                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF880e4f),
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                            color:Color(0xFF880e4f),
                          )),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF880e4f),)),
                      labelText: '${getLang(context,"Address")}', prefixIcon: const Icon(
                      Icons.location_history,color:Color(0xFF880e4f) ,
                    ),

                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  color: Colors.white,

                  child: TextFormField(
                    controller: priceController,
                    onChanged: (value){
                      price=value as int;
                    },

                    decoration:  InputDecoration(

                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF880e4f),
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:  BorderSide(
                            color:Color(0xFF880e4f),
                          )),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF880e4f),)),
                      labelText: '${getLang(context,"price")}',


                      prefixIcon: const Icon(
                        Icons.price_change,color: Color(0xFF880e4f),
                      ),

                    ),

                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // Text("${numberController}"),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Text("${getLang(context,"timeAv")}"),
                      const SizedBox(
                        height: 20.0,
                      ),

                      MaterialButton(color: Colors.amber, onPressed: (){pickDateTime();},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(width:double.infinity,height:40 ,child: Center(child: Text('${dateTime.toString()}'))),
                        ),),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MaterialButton(color: Colors.amber, onPressed: (){pickDateTime1();},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(width:double.infinity,height:40 ,child: Center(child: Text('${dateTime1.toString()}'))),
                        ),),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MaterialButton(color: Colors.amber, onPressed: (){pickDateTime();},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(width:double.infinity,height:40 ,child: Center(child: Text('${dateTime2.toString()}'))),
                        ),),


                    ],


                  ),
                ),
 SizedBox(height: 20,),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text("${getLang(context,"Choose category")}:"),
),
          CheckboxListTile(
              value: pys,
                title: Text('${getLang(context,"psychological Counseling")}'),
                activeColor: Colors.amber,
                onChanged: (val){
              setState(() {
                pys=val!;
                if(val==true)
                pys1=1;
              });
            }),

                CheckboxListTile(
                    activeColor: Colors.amber,value: mang,title: Text('${getLang(context,"Business consulting And management")}'),
                    onChanged: (val){
                      setState(() {
                        mang=val!;
                        if(val==true)
                          mang1=2;

                      });
                    }),
                CheckboxListTile(
                    activeColor: Colors.amber,value: mid,title: Text("Medical Consultation"),
                    //title: Text('${getLang(context,"Medical consultation")}'),
                    onChanged: (val){
                      setState(() {
                        mid=val!;
                        if(val==true)
                          mid1=3;

                      });
                    }),
                CheckboxListTile(
                    activeColor: Colors.amber,value: career,title: Text('${getLang(context,"Career Counseling")}'),
                    onChanged: (val){
                      setState(() {
                        career=val!;
                        if(val==true)
                          career1=4;

                      });
                    }),
                CheckboxListTile(
                    activeColor: Colors.amber,value: family,title: Text('${getLang(context,"Family Category")}'),
                    onChanged: (val){
                      setState(() {
                        family=val!;
                        if(val==true)
                          family1=5;
                      });
                    }),


                const SizedBox(
                  height: 40.0,
                ),
                MaterialButton(
                  color: Color(0xFF880e4f),

                  onPressed: () {

                    expertRegistert();
                  },
                  child:  Text(
                    '${getLang(context,"Save")}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),),




              ],
            ),
          ),),),
    );


  }
  Future<DateTime?> pickDate()=>showDatePicker(
      context: context,
      initialDate:dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
  );
  Future<TimeOfDay?> pickTime()=>showTimePicker(context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
  );
  Future pickDateTime()async {
    DateTime ?date = await pickDate();
    if (date == null) return;
    TimeOfDay?time = await pickTime();
    if (time == null) return;
    final dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
    );
    setState(() => this.dateTime = dateTime);
  }
  Future pickDateTime1()async {
    DateTime ?date = await pickDate();
    if (date == null) return;
    TimeOfDay?time = await pickTime();
    if (time == null) return;
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() => this.dateTime = dateTime1);
  }
  Future pickDateTime2()async {
    DateTime ?date = await pickDate();
    if (date == null) return;
    TimeOfDay?time = await pickTime();
    if (time == null) return;
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() => this.dateTime = dateTime2);
  }
}
