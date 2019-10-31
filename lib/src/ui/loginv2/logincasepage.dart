import 'package:adminkursus/src/provider/newloginprov.dart';
import 'package:adminkursus/src/ui/home/newhomepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginCasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<NewLoginProv>(context);
    switch (loginProv.loginStat) {
      case LoginStat.Loading:
        return NewSplash();
      case LoginStat.NotLogin:
        return Logincoeg();
      case LoginStat.DahLogin:
        return NewHomePage();
      default:
      return Container();
    }
  }
}

class NewSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<NewLoginProv>(context).cekSharedPref();
    return Scaffold(
      body: Container(child: Center(child: CircularProgressIndicator(),)),
    );
  }
}

class Logincoeg extends StatefulWidget {
  @override
  _LogincoegState createState() => _LogincoegState();
}

class _LogincoegState extends State<Logincoeg> {
  bool isLoading;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODsO: implement initState
    super.initState();
    isLoading = false;
  }
  @override
  Widget build(BuildContext context) {
    final newUserprov = Provider.of<NewLoginProv>(context);
    return Scaffold(
     // appBar: AppBar(title: Text("login boy"),),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
            children: <Widget>[
              SizedBox(height: 50,),
              Image.asset('images/lolicon.png'),
              TextFormField(
                decoration: InputDecoration(labelText: 'Id/No anggota'),
                controller: newUserprov.tid,
                validator: (e)=> e.length<1?"tak boleh kosong":null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),obscureText: true,
                controller: newUserprov.tpass,
                validator: (e)=> e.length<1?"tak boleh kosong":null,
              ),
              RaisedButton(child: isLoading?CircularProgressIndicator():Text('Login'),
              onPressed: ()async{
                if(_formkey.currentState.validate()){
                setState(() {
                 isLoading=true; 
                });
                newUserprov.loginator(newUserprov.tid.text, newUserprov.tpass.text).then((onValue){
                    if (onValue==null){
                      setState(() {
                       isLoading=false; 
                      });
                      showDialog(context: context,builder: (_)=>AlertDialog(content: Text('id atau pasword salah'),));
                    }
                });
                }
              },)
            ],
          ),
                  ),
        ),
      ),
    );
  }
}