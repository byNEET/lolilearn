import 'package:adminkursus/src/model/userprofil_model.dart';
import 'package:adminkursus/src/provider/userrepository.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUser extends StatefulWidget {
  final UserProfil profil;
  EditUser(this.profil);
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController tnama, tkelas;
  @override
  void initState() {
   
    super.initState();
    tnama = TextEditingController(text: widget.profil.nama);
    tkelas = TextEditingController(text: widget.profil.kelas ?? "");
  }

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lengkapi Data Profil anda coeg'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: tnama,
                decoration: InputDecoration(
                  labelText: "nama",
                ),
              ),
              TextFormField(
                controller: tkelas,
                decoration: InputDecoration(
                  labelText: "kelas",
                ),
              ),
              RaisedButton(
                child: Text('submit'),
                onPressed: () async {
                  RealdbApi()
                      .updateUser(widget.profil.uid,
                          {"nama": tnama.text, "kelas": tkelas.text})
                      .then((_) async => userProv.profil= await RealdbApi().getUserProfil(widget.profil.uid))
                      .then((_) => Navigator.pop(context));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
