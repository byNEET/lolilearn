import 'package:firebase_database/firebase_database.dart';

class UserProfil{
  String id,uid,email,nama,kelas,urlimg;
  DateTime createat;
  UserProfil({this.id,this.uid,this.email,this.nama,this.kelas,this.createat,this.urlimg});

  factory UserProfil.fromrealdb(DataSnapshot doc){
    return UserProfil(
      id: doc.key,
      uid: doc.value["uid"],
      email: doc.value["email"],
      nama: doc.value["nama"],
      kelas: doc.value["kelas"],
      urlimg: doc.value["urlimg"],
      createat: DateTime.parse(doc.value["createat"]) 
    );
  }

  Map<String,dynamic> toMap(){
    return {
      "uid":uid,
      "email":email,
      "nama":nama,
      "kelas":kelas,
      "urlimg":urlimg,
      "createat": createat.toIso8601String()
    };
  }
}