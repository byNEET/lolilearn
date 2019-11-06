import 'package:firebase_database/firebase_database.dart';

class CariSoalModel{
  String id,idsoalnya,jenis,titel;
  bool published;
  CariSoalModel({this.id,this.idsoalnya,this.jenis,this.titel,this.published});

  factory CariSoalModel.fromRealDb(DataSnapshot data){
    return CariSoalModel(
      id: data.key,
      idsoalnya: data.value["idsoal"],
      jenis: data.value["jenis"],
      titel: data.value["titel"],
      published: data.value["published"]
    );
  }

  factory CariSoalModel.fromMap(String k,Map v){
    return CariSoalModel(
      id: k,
      idsoalnya: v["idsoal"],
      jenis: v["jenis"],
      titel: v["titel"],
      published: v["published"]
    );
  }

  Map<String,dynamic> toMap(){
    return{
      "idsoal":idsoalnya,
      "jenis":jenis,
      "titel":titel,
      "published":published
    };
  }
}