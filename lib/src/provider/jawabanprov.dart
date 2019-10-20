import 'package:flutter/widgets.dart';

class JawabanProv with ChangeNotifier{
  Map<String,dynamic> _listJawaban={};

  Map<String,dynamic> get listJawaban=>_listJawaban;

  void  addListJawaban(String k,v){
    _listJawaban[k]=v;
    notifyListeners();
  }
}