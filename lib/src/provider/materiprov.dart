import 'package:adminkursus/src/model/materi_model.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:flutter/widgets.dart';

class MateriProv with ChangeNotifier{
  RealdbApi api =RealdbApi();

  String _tingkat;
  String _mapel;
  String _kelas;
  List<MateriModel> _listmateri;

  String get tingkat=>_tingkat;
  String get mapel=>_mapel;
  String get kelas=>_kelas;
  List<MateriModel> get listmateri=> _listmateri;

  set tingkat(String val){
    _tingkat = val;
    _mapel=null;
    _kelas=null;
    notifyListeners();
  }
  set mapel(String val){
    _mapel=val;
    notifyListeners();
  }
  set kelas(String val){
    _kelas=val;
    notifyListeners();
  }

  TextEditingController ttitel = TextEditingController(text: "");
  TextEditingController tisi = TextEditingController(text: "");

  void clearnonotif(){
    _tingkat=null;
    _mapel=null;
    _kelas=null;
     ttitel = TextEditingController(text: "");
     tisi = TextEditingController(text: "");
    // notifyListeners();
  }

  //---------------------------------------
  Future<List<MateriModel>> getListmateriRepo(String tingkat,String mapel)async{
    var getdata = await api.getListMateri(tingkat, mapel);
    if (getdata==null){
      return null;
    }else{
      _listmateri = getdata;
      return listmateri;
    }
  }

  Future<List<MateriModel>> getListmateriRepoAdmin(String tingkat,String mapel)async{
    var getdata = await api.getListMateriAdmin(tingkat, mapel);
    if (getdata==null){
      return null;
    }else{
      _listmateri = getdata;
      return listmateri;
    }
  }


}