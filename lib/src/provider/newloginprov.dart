import 'package:adminkursus/src/model/usernew_model.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginStat {Loading,DahLogin,NotLogin}

class NewLoginProv with ChangeNotifier{
RealdbApi api =RealdbApi();

TextEditingController tid = TextEditingController(text: "");
TextEditingController tpass = TextEditingController(text: "");


  
  
  UserNew _userNew;
  LoginStat _loginStat = LoginStat.Loading;

  UserNew get userNew => _userNew;
  LoginStat get loginStat => _loginStat;

  set userNew(UserNew val){
    _userNew = val;
    notifyListeners();
  } 

  Future<UserNew> loginator(String id,String pass)async{
    var cekcek = await api.loginatorapi(id, pass);
    if (cekcek == null){
      _loginStat = LoginStat.NotLogin;
      notifyListeners();
      return null;
    }else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("akun", userNewToJson(cekcek));

      _loginStat = LoginStat.DahLogin;
      _userNew =cekcek;
      notifyListeners();
      return userNew;

    }
  }

  Future<UserNew> cekSharedPref()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var oke = preferences.getString("akun");
    if(oke==""||oke==null){
      _loginStat = LoginStat.NotLogin;
      notifyListeners();
      return null;
    }else{
      _loginStat = LoginStat.DahLogin;
      _userNew = userNewFromJson(oke);
      notifyListeners();
      return userNew;
    }
    
  }

  Future<void> usernewLogout()async{
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString("akun", "");
    _loginStat = LoginStat.NotLogin;
    _userNew =null;
    notifyListeners();
    return null;
  }
}