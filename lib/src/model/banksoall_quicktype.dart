// To parse this JSON data, do
//
//     final banksoalModel = banksoalModelFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

//BanksoalModel banksoalModelFromJson(String str) => BanksoalModel.fromJson(json.decode(str));

String banksoalModelToJson(BanksoalModel data) => json.encode(data.toJson());

class BanksoalModel {
    String id;
    String jenis;
    String kelas;
    String mapel;
    bool published;
    Map<String,Selesai> selesai;
    List<Soalnye> soalnye;
    String titel;

    BanksoalModel({
      this.id,
        this.jenis,
        this.kelas,
        this.mapel,
        this.published,
        this.selesai,
        this.soalnye,
        this.titel, 
    });

    factory BanksoalModel.fromJson(String id,Map<dynamic, dynamic> json) => BanksoalModel(
        id:id,
        jenis: json["jenis"],
        kelas: json["kelas"],
        mapel: json["mapel"],
        published: json["published"],
        selesai:json["selesai"]==null?null: Map.from(json["selesai"].map((uid,val)=>MapEntry(uid, Selesai.fromJson(val)))),
        soalnye:json["soalnye"]==null?null: List<Soalnye>.from(json["soalnye"].map((x) => x == null ? null : Soalnye.fromJson(x))),
        titel: json["titel"],
    );

    Map<String, dynamic> toJson() => {
        "jenis": jenis,
        "kelas": kelas,
        "mapel": mapel,
        "published": published,
        "selesai": selesai,
        "soalnye": List<dynamic>.from(soalnye.map((x) => x == null ? null : x.toJson())),
        "titel": titel,
    };
}



class Selesai {
    List<String> jawabannye;
    int nilai;
    String tglselesai;
    String uid;
    String nama;

    Selesai({
        this.jawabannye,
        this.nilai,
        this.tglselesai,
        this.uid,
        this.nama
    });

    factory Selesai.fromJson(Map<dynamic, dynamic> json) => Selesai(
        jawabannye: List<String>.from(json["jawabannye"].map((x) => x == null ? null : x)),
        nilai: json["nilai"],
        tglselesai: json["tglselesai"], 
        uid: json["uid"],
        nama: json["nama"]
    );

    factory Selesai.fromRealdb(DataSnapshot json) => Selesai(
        jawabannye: List<String>.from(json.value["jawabannye"].map((x) => x == null ? null : x)),
        nilai: json.value["nilai"],
        tglselesai: json.value["tglselesai"], 
        uid: json.value["uid"],
        nama: json.value["nama"]
    );

    Map<String, dynamic> toJson() => {
        "jawabannye": List<dynamic>.from(jawabannye.map((x) => x == null ? null : x)),
        "nilai": nilai,
        "tglselesai": tglselesai,
        "uid": uid,
        "nama":nama
    };
}

class Soalnye {
    Map jawaban;
    String jawabanbenar;
    String pembahasan;
    String pertanyaan;

    Soalnye({
        this.jawaban,
        this.jawabanbenar,
        this.pembahasan,
        this.pertanyaan, 
    });

    factory Soalnye.fromJson(Map<dynamic, dynamic> json) => Soalnye(
       // jawaban: Jawaban.fromJson(json["jawaban"]),
        jawaban: json["jawaban"],
        jawabanbenar: json["jawabanbenar"],
        pembahasan: json["pembahasan"],
        pertanyaan: json["pertanyaan"],
    );

    Map<String, dynamic> toJson() => {
        "jawaban": jawaban,
        "jawabanbenar": jawabanbenar,
        "pembahasan": pembahasan,
        "pertanyaan": pertanyaan,
    };
}

class Jawaban {
    String a;
    String b;
    String c;
    String d;

    Jawaban({
        this.a,
        this.b,
        this.c,
        this.d,
    });

    factory Jawaban.fromJson(Map<String, dynamic> json) => Jawaban(
        a: json["A"],
        b: json["B"],
        c: json["C"],
        d: json["D"],
    );

    Map<String, dynamic> toJson() => {
        "A": a,
        "B": b,
        "C": c,
        "D": d,
    };
}
