import 'package:adminkursus/src/model/usernew_model.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:flutter/material.dart';

class UserManagementPage extends StatefulWidget {
  @override
  _UserManagementPageState createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  final RealdbApi api =RealdbApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Management'),),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
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
              :Container(child: Center(child: CircularProgressIndicator()),);
            },
          ),
        ],),
      ),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        return Navigator.push(context, MaterialPageRoute(builder: (_)=>TambahUserPage())).then((_){setState(() {});});
      },),
    );
  }
}

class TambahUserPage extends StatefulWidget {
  @override
  _TambahUserPageState createState() => _TambahUserPageState();
}

class _TambahUserPageState extends State<TambahUserPage> {
  final RealdbApi api = RealdbApi();
  
  final _formkey = GlobalKey<FormState>();

  TextEditingController tid;
  TextEditingController tnama;

  @override
  void initState() {
    // TODOs: implement initState
    super.initState();
    tid=TextEditingController(text: "");
    tnama=TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tambah user'),),
      body: SingleChildScrollView(child: Form(
              key: _formkey,
              child: Column(children: <Widget>[
         TextFormField(controller: tid,decoration: InputDecoration(labelText: 'No. Anggota/ID'),validator: (v)=>v.length<1?'tidak boleh kosong':null,),
         TextFormField(controller: tnama,decoration: InputDecoration(labelText: 'Nama User'),validator: (v)=>v.length<1?'tidak boleh kosong':null,),
         RaisedButton(child: Text('Simpan'),onPressed: ()=>_formkey.currentState.validate()?api.addUser(tid.text,tnama.text).then((_)=>Navigator.pop(context)):null,)
        ],),
      ),),
    );
  }
}