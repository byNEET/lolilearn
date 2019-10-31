import 'package:adminkursus/src/model/usernew_model.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:flutter/material.dart';

class UserManagementPage extends StatelessWidget {
  final RealdbApi api =RealdbApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Management'),),
      body: SingleChildScrollView(child: Column(children: <Widget>[
        FutureBuilder<List<UserNew>>(
          future: api.getListUser(),
          builder: (context,snapsut){
    return (snapsut.connectionState == ConnectionState.done)?
              (snapsut.hasData)?
                Container(child: Column(children: 
                snapsut.data.map((f)=>ListTile(
                  title: Text(f.id),
                  subtitle: Text(f.nama),
                )).toList()
                ,),)
              :Container(child: Text('hasdata = false'),)
            :Container(child: CircularProgressIndicator(),);
          },
        ),
      ],),),
    );
  }
}

class TambahUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}