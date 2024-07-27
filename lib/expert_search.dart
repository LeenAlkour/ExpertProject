

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/profile.dart';

import 'applocal.dart';
class expert_search extends StatefulWidget {
 String token;
 String searchExpert;
 expert_search({required this.token,required this.searchExpert});

  @override
  State<expert_search> createState() => _expert_searchState(token: token, searchExpert: searchExpert);
}
class _expert_searchState extends State<expert_search> {
  String token;
  String searchExpert;
  _expert_searchState({required this.token,required this.searchExpert});

  SearchExpert( ) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/expert/search/${searchExpert}');
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
    return responsebody;}

    } catch (e) {
      print(e.toString()); }
  }

  // ExpertProfile() async {
  //   var url = Uri.parse('http://10.0.2.2:8000/api/expertProfile/2');
  //   try {
  //     print('test');
  //     print('ExpertProfile');
  //     http.Response response = await http.get(url,
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Accept': 'application/json',
  //           'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODczZDk0OWZjYThkYzYwMzIzMjY3MDUzNzQ3YTZkYzU0N2I4ZjVmYTM4MzUzMWFiMzM3MjQ4MTcxODA4YTUwMWYwMzJjNGJmNzNlYjc5MzkiLCJpYXQiOjE2NzI3MjczMjYuNTIxNDksIm5iZiI6MTY3MjcyNzMyNi41MjE0OTQsImV4cCI6MTcwNDI2MzMyNi4zMjk4MjIsInN1YiI6IjQiLCJzY29wZXMiOltdfQ.sxPl311mwuqAcGZXu-wcmTMnVzGbP_0B-XKkJxFoXHqkPOVBhX3NTAjxE4-AlC-TNBUWOnAqnE9F9TS6zm9RBYJ67zWwDaVzTOHFpn0MVk5qxSgQeGi8-yuVJlOwe1iHIwWOwY62jpYvytINUJgSF3GmiUmoxMkRnzraLTVOynnmRTkznHayfS5-WdQaput7bjJRoLAL3rH1mXnFpI_rVDOA5xs9phhVcSBQ2n34MXz-Yc1dWLa2KyyJhndgyGB94x1EJuEpeLK8JmeE0lVF1U4lQ8KGfckHjS_KH-eTMC1kzuL2-mDB0g-EnjNKY7X7eRc7O98e75fDItDI5jYNbXzlAS_ydIpOOrBpf80XWi_N35qmgbDAYwwRbl61VPcVH6vCpTOmbeAWLJQFn1WinP_KTjmD8abMdBLd3agFQo0jVwyE_Kt_pyiwTyDGoTdmINKK44-57vMLUmeTcULFYkAT_JB_OZ9e3YeGm81b6zSLOoCOoMDWkn4Mc0Vgeo_wzTjv5SAjenShzadCHMAAKomFHufbParaI9UdVK5T5vna6UHPihor_qLNAyszSFuO3cFK-l_N-xc_fhJvtTf6JijuTtcGB00-y8kWbpKTnxXXRqHQV2R7-Nlqutw2xXRPMEEVO2dDowxs7poDzdNlzGyjPOr9ncbEVf82EVA8J2E' });
  //     var responsebody=jsonDecode(response.body); print(response.statusCode);
  //     print(responsebody);
  //     return responsebody['categories'];
  //   }
  //   catch (e) {
  //     print(e.toString()); } }
  // AddToFavorit() async {
  //   var url = Uri.parse('http://10.0.2.2:8000/api/addToFavorit/2');
  //   try { print('test'); print('AddToFavorit');
  //   http.Response response = await http.get(url,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWZlNjFmOTMwMzRjZTc2MGUzY2ExZTgxYjYyNTQ0MmY3NzgyNDhlNzM5MWY1ZWFhOTViNWRjMzI3NTgzOTM2YWUyNDU0OTZkMzY4NGU3MmMiLCJpYXQiOjE2NzI3MDY0NDQuNjM0NiwibmJmIjoxNjcyNzA2NDQ0LjYzNDYwMywiZXhwIjoxNzA0MjQyNDQ0LjYyNzMwMSwic3ViIjoiMiIsInNjb3BlcyI6W119.wUq1br3jtS_PYhUAISbLH9oDm1m3sDfo5VUvs3KEgXJsjkHfvRydCCKXdW7XcWLki-4aqnPOizxulO6yq75tvRZWEMgPbVedPn1IVYGDVw2hR_rfdQQRozCh2GJemU6c0YKElJ8qVV7IOaYKQUf0lz704bb9Cia3uKZ9hqlace3jgpQvYTXwnXR5tRMXP5kuFS2y6TQujHrzzcNy9yXXBCCwNBw2GiYLCtefo9Um0sxFoT6kJ0WBFeCFbj99xq0xrIwtuQaqPRAHUMBQfZyRc3vFdRQnWALthCyzIFk_gYUWQzsnJ0KrWfOvFOxnZk181pAQQ07uS9w5AKtUSA9LuomfsG5fa61wShfVyHwqwYoc8CyvOEurcOqgi5E6ogiqEv6QwXXXq3YNub31PG0OKbdjfNFdF_yoDTNnzwNZL7SK54Kou3qkzTTqjcIPs8b-4pXRsHMnLKux1hWbkrUxHJWQ6G7ffauoIEF6eVLTvuWejPbjSHR3n3qbfz8owJfoZYHvP3Ec7itWP7-f8Gxm0nsG_cFc9JNHE6TMIcSgd3Ct74zaxhh8ln0MIO8Rz0gBQmlOF7Q8mYJSIj6RiWmI81P5lQ-s7JaH7kaotQtGkExbz7T5yXvzqAvknmkmjkC3n8iKdPs7a5u9ywJn-hvjBl3WRMEun4trhUTvTBDPk88' });
  //   var responsebody=jsonDecode(response.body);
  //   print(response.statusCode);
  //   print(responsebody);
  //   return responsebody;
  //
  //   } catch (e) { print(e.toString()); } }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor:  Colors.indigoAccent.withOpacity(0.5),
      ),
      body: FutureBuilder(
          future:SearchExpert(),
           builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.hasData){

              return ListView.builder(itemCount:snapshot.data.length ,
                  itemBuilder: (context,i){

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 50,
                    decoration:BoxDecoration(borderRadius: BorderRadius.circular(2.0),),
                    child:
                    Container(

                      height: 50,
                      decoration:BoxDecoration(color:Colors.grey.withOpacity(0.2),borderRadius: BorderRadius.circular(2.0),),
                      child:
                      MaterialButton(
                          onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  profile(token:token,id:snapshot.data[i]["id"]))); },
                          child: Text(snapshot.data[i]["name"],style: TextStyle(fontSize: 30),)),
                    ),
                  ),

                );

                  });
            }
            else
              return Center(child: Text("${getLang(context,"Enter name for search")}"));

    },
    ));
  }
}
