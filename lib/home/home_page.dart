import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/home/user_details.dart';
import 'package:http_riverpod/models/userModel.dart';
import 'package:http_riverpod/providers/data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final _data=ref.watch(userdataProvider);
    return Scaffold(
      appBar: AppBar(title: Text('riverpod http'),centerTitle: true,),
      body: _data.when(
      data: (_data){
        List<User> userlist=_data.map((e)=>e).toList();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: ListView.builder(
                itemCount: userlist.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UserDetail(user: userlist[index]),)
                      );
                    },
                    child: Card(
                      elevation: 4,
                      color: Colors.blue.shade400,
                      child: ListTile(
                        title: Text(userlist[index].first_name),
                        subtitle: Text(userlist[index].last_name),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(userlist[index].avatar)),
                      ),
                    ),
                  );
              },)
              )
            ],
          ),
        );
      }, 
      error: (err,s)=>Center(child: Text(err.toString())), 
      loading: ()=>Center(
        child: CircularProgressIndicator(),
      )
      ),
    );
  }
}