//import 'package:adminkursus/src/data/staticdata.dart';
import 'package:flutter/foundation.dart';

class SearchProv with ChangeNotifier {
  String _tingkat;
  String _kelas;//=StaticData().kelas[0];
  String _mapel;//=StaticData().mapel[0];

  String get tingkat=>_tingkat;
  String get kelas=>_kelas;
  String get mapel=>_mapel;
  set kelas(String val){
    _kelas=val;
    notifyListeners();
  }
  set mapel(String val){
    _mapel=val;
    notifyListeners();
  }
  set tingkat(String val){
    _tingkat = val;
    _mapel=null;
    _kelas=null;
    notifyListeners();
  }
}