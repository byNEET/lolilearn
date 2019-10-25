import 'package:flutter/widgets.dart';

class BuatPaketSoalProv with ChangeNotifier{
  String _kelas;//=StaticData().kelas[0];
  String _mapel;
  String _jenis;

  String get kelas=>_kelas;
  String get mapel=>_mapel;
  String get jenis=>_jenis;

  set kelas(String val){
    _kelas=val;
    notifyListeners();
  }
  set mapel(String val){
    _mapel=val;
    notifyListeners();
  }
  set jenis(String val){
    _jenis=val;
    notifyListeners();
  }

   TextEditingController ttitel = TextEditingController(text: "");

  void clear(){
    _kelas =null;
    _mapel =null;
    _jenis = null;
    ttitel.clear();
    notifyListeners();
  }
}