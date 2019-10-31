import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:flutter/foundation.dart';

class SoalRepositoryProv with ChangeNotifier{

  RealdbApi api = RealdbApi();

  BanksoalModel _banksoal;
  List<Soalnye> _soalnye;

  BanksoalModel get banksoal=>_banksoal;
  List<Soalnye> get soalnye =>_soalnye;

  set banksoal(BanksoalModel val){
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

  Future<BanksoalModel> getsetBankSoalnye(String idsoal)async{
    var res = await api.getBankSoalnya(idsoal);
    _banksoal = res;
    return banksoal;
  }
}