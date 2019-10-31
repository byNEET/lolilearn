// To parse this JSON data, do
//
//     final userNew = userNewFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

UserNew userNewFromJson(String str) => UserNew.fromMap(json.decode(str));

String userNewToJson(UserNew data) => json.encode(data.toMap());

class UserNew {
    DateTime createat;
    String id;
    String kelas;
    String nama;
    String pass;
    String tingkat;

    UserNew({
        this.createat,
        this.id,
        this.kelas,
        this.nama,
        this.pass,
        this.tingkat,
    });

     factory UserNew.fromMap(Map<dynamic, dynamic> json) => UserNew(
        createat: DateTime.parse(json["createat"]),
        id: json["id"],
        kelas: json["kelas"],
        nama: json["nama"],
        pass: json["pass"],
        tingkat: json["tingkat"],
    );

    factory UserNew.fromRealDb(DataSnapshot json) => UserNew(
        createat: DateTime.parse(json.value["createat"]),
        id: json.value["id"],
        kelas: json.value["kelas"],
        nama: json.value["nama"],
        pass: json.value["pass"],
        tingkat: json.value["tingkat"],
    );

    Map<String, dynamic> toMap() => {
        "createat": createat.toIso8601String(),
        "id": id,
        "kelas": kelas,
        "nama": nama,
        "pass": pass,
        "tingkat": tingkat,
    };
}
