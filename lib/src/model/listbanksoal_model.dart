// To parse this JSON data, do
//
//     final listbanksoal = listbanksoalFromJson(jsonString);

import 'dart:convert';

class Listbanksoal {
    String id;
    DateTime createat;
    String idsoal;
    String jenis;
    String kelas;
    String mapel;
    bool published;
    String tingkat;
    String titel;

    Listbanksoal({
      this.id,
        this.createat,
        this.idsoal,
        this.jenis,
        this.kelas,
        this.mapel,
        this.published,
        this.tingkat,
        this.titel,
    });

    //factory Listbanksoal.fromJson(String str) => Listbanksoal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Listbanksoal.fromMap(String k, Map<dynamic, dynamic> json) => Listbanksoal(
        id: k,
        createat: DateTime.parse(json["createat"]),
        idsoal: json["idsoal"],
        jenis: json["jenis"],
        kelas: json["kelas"],
        mapel: json["mapel"],
        published: json["published"],
        tingkat: json["tingkat"],
        titel: json["titel"],
    );

    Map<String, dynamic> toMap() => {
        "createat": createat.toIso8601String(),
        "idsoal": idsoal,
        "jenis": jenis,
        "kelas": kelas,
        "mapel": mapel,
        "published": published,
        "tingkat": tingkat,
        "titel": titel,
    };
}