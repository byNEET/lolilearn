import 'package:firebase_database/firebase_database.dart';

class CariSoalModel{
  String id,idsoalnya,jenis,titel;
  CariSoalModel({this.id,this.idsoalnya,this.jenis,this.titel});

  factory CariSoalModel.fromRealDb(DataSnapshot data){
    return CariSoalModel(
      id: data.key,
      idsoalnya: data.value["idsoal"],
      jenis: data.value["jenis"],
      titel: data.value["titel"]
    );
  }

  factory CariSoalModel.fromMap(String k,Map v){
    return CariSoalModel(
      id: k,
      idsoalnya: v["idsoal"],
      jenis: v["jenis"],
      titel: v["titel"]
    );
  }

  Map<String,dynamic> toMap(){
    return{
      "idsoal":idsoalnya,
      "jenis":jenis,
      "titel":titel
    };
  }
}