import 'package:flutter/material.dart';

class SystemCall{

  static void generateWillPopElement(BuildContext context){
    showDialog(context: context,builder: (_)=>AlertDialog(
      title: Text('Yakin keluar ?'),
      content: Text('jawaban anda tidak akan disimpan'),
      actions: <Widget>[
        FlatButton.icon(icon: Icon(Icons.done),label: Text('batal'),onPressed: ()=>Navigator.pop(_),),
        FlatButton.icon(icon: Icon(Icons.done),label: Text('batal'),onPressed: ()=>Navigator.pop(context),),
      ],
    ));
  }
  
}