import 'package:adminkursus/src/model/banksoall_quicktype.dart';
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

  void setAllListJawabanAndPoint(List<String> jawaban,List<Soalnye> benar){
    _listJawaban.clear();
    _listPoint.clear();
    var countkey = List<int>.generate(jawaban.length-1, (i)=>(i+1));
    for (var v in countkey){
      _listJawaban[v.toString()]=jawaban[v];
      _listPoint[v.toString()]=(jawaban[v]==benar[v].jawabanbenar)?1:0;
    }
    notifyListeners();
  }

  void clear(){
    _listJawaban={};
    _listPoint={};
    notifyListeners();
  }

 
}