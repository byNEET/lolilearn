

import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:flutter/material.dart';

class BuatSoalProv with ChangeNotifier{
  Soalnye _soalnyaModel;
  Soalnye get soalnyaModel => _soalnyaModel;
  set soalnyaModel(Soalnye val){
    _soalnyaModel = val;
    notifyListeners();
  }

  String _jawabanBenar="A";
  String get jawabanBenar => _jawabanBenar;
  set jawabanBenar(String val){
    _jawabanBenar =val;
    notifyListeners();
  }
 
  TextEditingController tsoal =  TextEditingController(text: "");
  TextEditingController tjawabanA =  TextEditingController(text: "");
  TextEditingController tjawabanB =  TextEditingController(text: "");
  TextEditingController tjawabanC =  TextEditingController(text: "");
  TextEditingController tjawabanD =  TextEditingController(text: "");
  TextEditingController tPembahasan =  TextEditingController(text: "");

  void clear(){
    _jawabanBenar="A";
    tsoal.clear();
    tjawabanA.clear();
    tjawabanB.clear();
    tjawabanC.clear();
    tjawabanD.clear();
    tPembahasan.clear();
    notifyListeners();
  }
}