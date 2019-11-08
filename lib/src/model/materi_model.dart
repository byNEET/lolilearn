// To parse this JSON data, do
//
//     final materiModel = materiModelFromJson(jsonString);

import 'dart:convert';

import 'package:adminkursus/src/service/systemcall.dart';

class MateriModel {
  String id;
    String isimateri;
    String kelas;
    String mapel;
    String tingkat;
    String titel;
    bool published;

    MateriModel({
      this.id,
        this.isimateri,
        this.kelas,
        this.mapel,
        this.tingkat,
        this.titel,
        this.published
    });

   // factory MateriModel.fromJson(String str) => MateriModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MateriModel.fromMap(String id,Map<dynamic, dynamic> json) => MateriModel(
        id: id,
        isimateri: SystemCall.decodeFromBase64(json["isimateri"]) ,
        kelas: json["kelas"],
        mapel: json["mapel"],
        tingkat: json["tingkat"],
        titel: json["titel"],
        published: json["published"]
    );

    Map<String, dynamic> toMap() => {
        "isimateri": SystemCall.encodetoBase64(isimateri) ,
        "kelas": kelas,
        "mapel": mapel,
        "tingkat": tingkat,
        "titel": titel,
        "published" : true  //ngetes buat materi langsung push
    };

    Map<String, dynamic> toMapEdit() => {
        "isimateri": SystemCall.encodetoBase64(isimateri) ,
        "kelas": kelas,
        "mapel": mapel,
        "tingkat": tingkat,
        "titel": titel,
    };
}