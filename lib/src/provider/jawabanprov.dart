import 'package:flutter/widgets.dart';

class JawabanProv with ChangeNotifier{
  Map<String,dynamic> _listJawaban={};
  Map<String,dynamic> _listPoint={};
  

  Map<String,dynamic> get listJawaban=>_listJawaban;
  Map<String,dynamic> get listPoint=>_listPoint;
  int get nilai=>countNilai();

  int countNilai(){
    var _okesip=0;
    listPoint.forEach((k,v)=>_okesip+=v);
    return _okesip;
  }

  void  addListJawabanAndPoint(String k,String v,String b){
    _listJawaban[k]=v;

    _listPoint[k]=(v==b)?1:0;
    print(listPoint.toString());
    notifyListeners();
  }

  addListJawabanAndPointselesai(String k,String v,String b){
    _listJawaban[k]=v;

    _listPoint[k]=(v==b)?1:0;
    print(listPoint.toString());
    notifyListeners();
  }

  void clear(){
    _listJawaban={};
    _listPoint={};
    notifyListeners();
  }

 
}