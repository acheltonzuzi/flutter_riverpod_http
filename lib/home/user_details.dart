import 'package:flutter/material.dart';
import 'package:http_riverpod/models/userModel.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key,required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.first_name+' '+user.last_name),),
      body: Center(child: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(user.avatar),radius: 80,),
            Text(user.first_name+' '+user.last_name,style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic),),
            Text(user.email)
          ],
        ),
      )),
    );
  }
}