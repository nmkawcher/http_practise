import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   String phoneNumber='';

  @override
  void initState() {
    super.initState();
    getPhoneNumber();
  }

  void getPhoneNumber()async{
   final sharedPre= await SharedPreferences.getInstance();
   phoneNumber=sharedPre.getString('phone')??'';
   setState(() {

   });

  }

  @override
  Widget build(BuildContext context) {
    final sharedPre=SharedPreferences.getInstance();

    return Scaffold(
      appBar: AppBar(
        title: Text(phoneNumber),
      ),
    );
  }
}
