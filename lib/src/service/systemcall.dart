import 'dart:convert';

import 'package:flutter/material.dart';

class SystemCall{

  static void generateWillExitAppElement(BuildContext context){
    showDialog(context: context,builder: (_)=>AlertDialog(
      title: Text('Yakin keluar ?'),
      content: Text('ah....'),
      actions: <Widget>[
        FlatButton.icon(icon: Icon(Icons.done),label: Text('batal'),onPressed: ()=>Navigator.pop(_),),
        FlatButton.icon(icon: Icon(Icons.done),label: Text('batal'),onPressed: ()=>Navigator.pop(context),),
      ],
    ));
  }
  
  static String encodetoBase64(String txt){
    List encodetext = utf8.encode(txt);
    String base64str = base64.encode(encodetext);
    print(base64str);
    return base64str;
  }

  static String decodeFromBase64(String txt){
    String decodetext = utf8.decode(base64.decode(txt));
    print(decodetext);
    return decodetext;
  }
}