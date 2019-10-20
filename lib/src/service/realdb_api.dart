import 'package:adminkursus/src/model/banksoal_model.dart';
import 'package:adminkursus/src/model/carisoal_model.dart';
import 'package:adminkursus/src/model/soalnya_model.dart';
import 'package:adminkursus/src/model/userprofil_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RealdbApi{
  static final FirebaseDatabase db = FirebaseDatabase.instance;
  final DatabaseReference ref = db.reference();


  //--------------------------------user-------------------------------------
  Future<UserProfil> getUserProfil(String uid) async{
    return ref.child('user/$uid').once().then((val)=>UserProfil.fromrealdb(val));
  }

  Future<UserProfil> cekUser(FirebaseUser user) async{
    var snap = await ref.child('user/${user.uid}').once();
    print(snap.value);
    if (snap.value != null){
      print('data user ada');
      return UserProfil.fromrealdb(snap);
    }else{
      print('data user tidak ada');
       return createUser(user.uid, UserProfil(
        uid: user.uid,
        nama: user.displayName,
        email: user.email,
        kelas: null,
        urlimg: user.photoUrl,
        createat: DateTime.now()
      )).then((_)=>cekUser(user));
      
    }
  }

  Future<void> createUser(String uid,UserProfil data)async {
    return ref.child('user/$uid').set(data.toMap()).then((_)=>print('create user successfull'));
  }
  Future<void> updateUser(String uid,Map<String,dynamic> data){
    return ref.child('user/$uid').update(data).then((_)=>print('update user successfull'));
  }

  //-------------------------------------soal-------------------------------------------------
  Future<List<CariSoalModel>> cariSoal(String kelas,String mapel) async{
    print('cari soal');
    var getdata =await  ref.child('carisoal/$kelas/$mapel').once();
    Map coeg = getdata.value;
    print(coeg);
    List<CariSoalModel> list=[];
    if (coeg!=null){
      coeg.forEach((k,v)=>list.add(CariSoalModel.fromMap(k,v)));
    return list;
    }else{
      return null;
    }
  }

  Future<SoalnyaModel> getSoalnya(String idsoal) async{
    print('getsoal func');
    DataSnapshot data =  await db.reference().child('/banksoal/idsoal').once();
      print('getSoalnya:'+data.value.toString());
      return SoalnyaModel.fromRealDb(data);
    
  }

  // Future<List<BankSoalModel>> getListSoal(){
  //   return ref.child('banksoal').once().then((data){
  //     print('get list soal:'+ data.value);
  //     Map oke =data.value;
  //     List<BankSoalModel> coeg=[];
  //     oke.forEach((k,v)=>coeg.add(BankSoalModel(id: k,soalnye: )));
  //   });
  // }
} 