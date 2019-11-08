import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:adminkursus/src/model/listbanksoal_model.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:flutter/foundation.dart';

class SoalRepositoryProv with ChangeNotifier{

  RealdbApi api = RealdbApi();

  Listbanksoal _banksoal;
  List<Soalnye> _soalnye;

  Listbanksoal get banksoal=>_banksoal;
  List<Soalnye> get soalnye =>_soalnye;

  set banksoal(Listbanksoal val){
    _banksoal = val;
    notifyListeners();
  }
  set soalnye(List<Soalnye> val){
    _soalnye = val;
    notifyListeners();
  }

  void clear(){
    _banksoal=null;
    notifyListeners();
  }

  Future<List<Soalnye>> getsetBankSoalnye(String idsoal)async{
    var res = await api.getSoalnye(idsoal);
    _soalnye = res;
    return soalnye;
  }
  // Future<List<Soalnye>> getsetListSoalnye(String id)async{
  //   var res = await api.get
  // }
}