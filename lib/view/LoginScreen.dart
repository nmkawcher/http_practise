import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_practise/HomeScreen.dart';
import 'package:http_practise/LoginResponseModel.dart';
import 'package:http_practise/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String userName;
 late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('Login',style: TextStyle(fontSize: 30),),

        SizedBox(height: 20,),

        TextField(
          onChanged: (value){
              userName=value;
        },
        ),

        SizedBox(height: 20,),

        TextField(
          onChanged: (value){
            password=value;
          },
        ),

        SizedBox(height: 20,),

        GestureDetector(
          onTap: (){
               loginUser(userName, password);
          },
          child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width*.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green
            ),
            child: Text('Login',style: TextStyle(color: Colors.white),),
          ),
        )

      ],),
    );
  }


  void loginUser(String email,String password)async{

    Uri uri=Uri.parse('https://motorsheba.com/api/login');

    final map={
      'email': email,
      'password':password
    };

  final response= await post(uri,body: map,);

  if(response.statusCode==200){

    final mainResponse=jsonDecode(response.body); //convert in json

     LoginResponseModel model=LoginResponseModel.fromJson(mainResponse);



    final sharedPre= await SharedPreferences.getInstance();
    sharedPre.setStringList('p',model.phone??'' );

    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

  }else{
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(response.body.toString())));
  }

  }
}
