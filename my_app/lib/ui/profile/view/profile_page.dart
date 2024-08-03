import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{

  const ProfilePage({super.key});
  
  @override
  State<StatefulWidget> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{

  @override
    void initState() {
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20.0), // Padding cho toàn bộ GridView
          child: Text("this is profile page")
    ));
  }

  
}