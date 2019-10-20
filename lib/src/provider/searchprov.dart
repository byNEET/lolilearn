//import 'package:adminkursus/src/data/staticdata.dart';
import 'package:flutter/foundation.dart';

class SearchProv with ChangeNotifier {
  String _kelas;//=StaticData().kelas[0];
  String _mapel;//=StaticData().mapel[0];
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
}