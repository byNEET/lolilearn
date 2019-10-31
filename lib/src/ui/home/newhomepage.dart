import 'package:adminkursus/src/provider/newloginprov.dart';
import 'package:adminkursus/src/ui/soal/carisoalpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewHomePage extends StatefulWidget {
  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    final newuserprov = Provider.of<NewLoginProv>(context);
    return SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: 100,),
            Text(newuserprov.userNew.nama),
            Text(newuserprov.userNew.id),
            
            Container(child: Card(child: Text('carousel'),),height: 100,width: double.infinity,),
            Container(child: Card(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>CariSoalPage())),
                    child: Column(children: <Widget>[
                    Icon(Icons.add_circle),
                    Text('Cari soal')
                  ],),
                ),
                Column(children: <Widget>[
                  Icon(Icons.add_circle),
                  Text('panduan')
                ],),
                Column(children: <Widget>[
                  Icon(Icons.add_circle),
                  Text('tips')
                ],),
                Column(children: <Widget>[
                  Icon(Icons.add_circle),
                  Text('tentang')
                ],),
              ],
            ),),),
            RaisedButton(child: Text('LogOut'),onPressed: ()=>Provider.of<NewLoginProv>(context).usernewLogout(),)
          ],),
        ),
      ),
    );
  }
}