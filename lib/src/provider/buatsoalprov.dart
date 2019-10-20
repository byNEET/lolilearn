

import 'package:adminkursus/src/model/soalnya_model.dart';
import 'package:flutter/material.dart';

class BuatSoalProv with ChangeNotifier{
  SoalnyaModel _soalnyaModel;
  SoalnyaModel get soalnyaModel => _soalnyaModel;
  set soalnyaModel(SoalnyaModel val){
    _soalnyaModel = val;
    notifyListeners();
  }

  String _kelas;//=StaticData().kelas[0];
  String _mapel;//=StaticData().mapel[0];
  String _jawabanBenar;
  String get kelas=>_kelas;
  String get mapel=>_mapel;
  String get jawabanBenar => _jawabanBenar;
  set kelas(String val){
    _kelas=val;
    notifyListeners();
  }
  set mapel(String val){
    _mapel=val;
    notifyListeners();
  }
  set jawabanBenar(String val){
    _jawabanBenar =val;
    notifyListeners();
  }
  TextEditingController ttitel = TextEditingController(text: "");
  TextEditingController tsoal =  TextEditingController(text: "");
  TextEditingController tjawabanA =  TextEditingController(text: "");
  TextEditingController tjawabanB =  TextEditingController(text: "");
  TextEditingController tjawabanC =  TextEditingController(text: "");
  TextEditingController tjawabanD =  TextEditingController(text: "");

  void clear(){
    _kelas =null;
    _mapel =null;
    _jawabanBenar=null;
    ttitel.clear();
    tsoal.clear();
    tjawabanA.clear();
    tjawabanB.clear();
    tjawabanC.clear();
    tjawabanD.clear();
    notifyListeners();
  }
}