import 'package:flutter/widgets.dart';

class JawabanProv with ChangeNotifier{
  Map<String,dynamic> _listJawaban={};
  Map<String,dynamic> _listPoint={};
  int _nilai=0;

  Map<String,dynamic> get listJawaban=>_listJawaban;
  Map<String,dynamic> get listPoint=>_listPoint;
  int get nilai=>countNilai();

  int countNilai(){
    listPoint.forEach((k,v)=>_nilai+=v);
    return _nilai;
  }

  void  addListJawabanAndPoint(String k,String v,String b){
    _listJawaban[k]=v;

    _listPoint[k]=v==b?1:0;
    notifyListeners();
  }


 
}