import 'package:adminkursus/src/model/userprofil_model.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

enum DataProfil {Loading,Lengkap, BelumLengkap}

class UserRepository with ChangeNotifier {
  RealdbApi api = RealdbApi();

  FirebaseAuth _auth;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn;
  Status _status = Status.Uninitialized;
  UserProfil _profil;
  DataProfil _dataProfil = DataProfil.Loading;

  UserRepository.instance()
      : _auth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn() {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Status get status => _status;
  FirebaseUser get user => _user;
  UserProfil get profil => _profil;
  DataProfil get dataProfil => _dataProfil;

  set profil(UserProfil val){
    _profil = val;
    notifyListeners();
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e);
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }

  }

  Future signOut() async {
    _auth.signOut();
    _googleSignIn.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;

      // api.cekUser(firebaseUser)
      // .then((value){
      //   print(value.toMap());
      // _profil = value;
      // if (value.kelas==null || value == null){
      //   _dataProfil = DataProfil.BelumLengkap;
       
      // } else{
      //   _dataProfil = DataProfil.Lengkap;
       
      // }
      // });

      var cekuser = await api.cekUser(firebaseUser);
      _profil=cekuser;
      
    }
    notifyListeners();
  }
}