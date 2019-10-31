import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:adminkursus/src/model/carisoal_model.dart';
import 'package:adminkursus/src/model/usernew_model.dart';
import 'package:firebase_database/firebase_database.dart';

class RealdbApi{
  static final FirebaseDatabase db = FirebaseDatabase.instance;
  final DatabaseReference ref = db.reference();

//----------------login custom------------------------------------------------

Future<UserNew> loginatorapi(String id,String pass)async{
 // var cek = ref.child('user/$pass');
  var cek2 = await ref.child('user/$id').once();
  print(cek2.value);
  if (cek2.value !=null){
    if (cek2.value["pass"]==pass){
      return UserNew.fromRealDb(cek2);
    }else{return null;}   
  }else{return null;}
}

Future<UserNew> getUserDetil(String id)async{
  print('get userdetil pre-processing...');
  return ref.child('user/$id').once().then((onValue)=>UserNew.fromRealDb(onValue));
}

//-----------------user admin------------------------------------
Future<List<UserNew>> getListUser()async{
  return ref.child('user').once().then((onValue){
    List<UserNew> litUser = List();
    (onValue.value as Map).forEach((k,v)=>litUser.add(UserNew.fromMap(v)));
   return litUser;
  });
}

Future<void> addUser(UserNew data)async{
  return ref.child('user/${data.id}').set(data.toMap()).then((_)=>print('add user ${data.id} suksess isi dua'));
}
Future<void> deletUser(String id)async{
  return ref.child('user/$id').remove().then((_)=>print('remove user $id suksess isi dua'));
}

  //--------------------------------user googlesign-------------------------------------
  // Future<UserProfil> getUserProfil(String uid) async{
  //   return ref.child('user/$uid').once().then((val)=>UserProfil.fromrealdb(val));
  // }

  // Future<UserProfil> cekUser(FirebaseUser user) async{
  //   var snap = await ref.child('user/${user.uid}').once();
  //   print(snap.value);
  //   if (snap.value != null){
  //     print('data user ada');
  //     return UserProfil.fromrealdb(snap);
  //   }else{
  //     print('data user tidak ada');
  //      return createUser(user.uid, UserProfil(
  //       uid: user.uid,
  //       nama: user.displayName,
  //       email: user.email,
  //       kelas: null,
  //       urlimg: user.photoUrl,
  //       createat: DateTime.now()
  //     )).then((_)=>cekUser(user));
      
  //   }
  // }

  // Future<void> createUser(String uid,UserProfil data)async {
  //   return ref.child('user/$uid').set(data.toMap()).then((_)=>print('create user successfull'));
  // }
  // Future<void> updateUser(String uid,Map<String,dynamic> data){
  //   return ref.child('user/$uid').update(data).then((_)=>print('update user successfull'));
  // }

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

  Future<BanksoalModel> getBankSoalnya(String idsoal) async{
    print('getsoal func');
    DataSnapshot data =  await db.reference().child('/banksoal/$idsoal').once();
      print('getSoalnya:'+data.value.toString());
      return BanksoalModel.fromJson(data.key, data.value);
  }

  Future<List<Soalnye>> getSoalnye(String idsoal)async{
    return ref.child('banksoal/$idsoal/soalnye').once().then((onValue){
      return List<Soalnye>.from(onValue.value.map((x) => x == null ? null : Soalnye.fromJson(x)));
    });
  }
  Future<Selesai> getUserSelesaiDetil(String idsoal,String iduser)async{
    return ref.child('banksoal/$idsoal/selesai/$iduser').once().then((onValue){
      return Selesai.fromRealdb(onValue);
    });
  }

  Future<void> simpanJawaban(String idsoal,Map<String,dynamic> n,String uid,int nilai)async{
   return db.reference().child('banksoal/$idsoal/selesai/$uid').set({
      "uid":uid,
      "nilai":nilai,
      "tglselesai":DateTime.now().toIso8601String(),
      "jawabannye":n
    });    
  }

//------------------------------------------------------------admin----------------------------------

  Future<List<BanksoalModel>> getListSoal()async{
    var data = await ref.child('banksoal').once();
      print('get list soal:'+ data.value.toString());
      Map oke =data.value;
      List<BanksoalModel> coeg=[];
      oke.forEach((k,v)=>coeg.add(BanksoalModel.fromJson(k,v)));
      return coeg;
  }

  Future<void> setSoal(String idsoal,String no,Soalnye oke)async{
    return ref.child('banksoal/$idsoal/soalnye/$no').set(oke.toJson());
  }

  Future<void> buatPaketSoal(Map<String,dynamic> data)async{
    return ref.child('banksoal').push().set(data).then((_)=>print("buat paket soal sukses, cus input"));
  }

  Future<void> pushPaketSoal(String kelas,String mapel, CariSoalModel sual)async{
    return ref.child('carisoal/$kelas/$mapel').push().set(sual.toMap()).then((_)=>print("push soal sukses")).then((_){
      return ref.child('banksoal/${sual.idsoalnya}/published').set(true).then((_)=>print('change published to true'));
    });
  }
}  