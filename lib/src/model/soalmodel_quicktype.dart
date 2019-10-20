// To parse this JSON data, do
//
//     final soalModel = soalModelFromJson(jsonString);

import 'dart:convert';

SoalModel soalModelFromJson(String str) => SoalModel.fromJson(json.decode(str));

String soalModelToJson(SoalModel data) => json.encode(data.toJson());

class SoalModel {
    String kelas;
    String mapel;
    List<Soalnye> soalnye;
    Sudahkerjakan sudahkerjakan;

    SoalModel({
        this.kelas,
        this.mapel,
        this.soalnye,
        this.sudahkerjakan,
    });

    factory SoalModel.fromJson(Map<String, dynamic> json) => SoalModel(
        kelas: json["kelas"],
        mapel: json["mapel"],
        soalnye: List<Soalnye>.from(json["soalnye"].map((x) => x == null ? null : Soalnye.fromJson(x))),
        sudahkerjakan: Sudahkerjakan.fromJson(json["sudahkerjakan"]),
    );

    Map<String, dynamic> toJson() => {
        "kelas": kelas,
        "mapel": mapel,
        "soalnye": List<dynamic>.from(soalnye.map((x) => x == null ? null : x.toJson())),
        "sudahkerjakan": sudahkerjakan.toJson(),
    };
}

class Soalnye {
    Jawaban jawaban;
    String jawabanbenar;
    String pembahasan;
    String pertanyaan;

    Soalnye({
        this.jawaban,
        this.jawabanbenar,
        this.pembahasan,
        this.pertanyaan,
    });

    factory Soalnye.fromJson(Map<String, dynamic> json) => Soalnye(
        jawaban: Jawaban.fromJson(json["jawaban"]),
        jawabanbenar: json["jawabanbenar"],
        pembahasan: json["pembahasan"],
        pertanyaan: json["pertanyaan"],
    );

    Map<String, dynamic> toJson() => {
        "jawaban": jawaban.toJson(),
        "jawabanbenar": jawabanbenar,
        "pembahasan": pembahasan,
        "pertanyaan": pertanyaan,
    };
}

class Jawaban {
    String a;
    String b;

    Jawaban({
        this.a,
        this.b,
    });

    factory Jawaban.fromJson(Map<String, dynamic> json) => Jawaban(
        a: json["a"],
        b: json["b"],
    );

    Map<String, dynamic> toJson() => {
        "a": a,
        "b": b,
    };
}

class Sudahkerjakan {
    Uid uid;

    Sudahkerjakan({
        this.uid,
    });

    factory Sudahkerjakan.fromJson(Map<String, dynamic> json) => Sudahkerjakan(
        uid: Uid.fromJson(json["uid"]),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid.toJson(),
    };
}

class Uid {
    String idraport;
    int nilai;
    String tglmulai;
    String uid;

    Uid({
        this.idraport,
        this.nilai,
        this.tglmulai,
        this.uid,
    });

    factory Uid.fromJson(Map<String, dynamic> json) => Uid(
        idraport: json["idraport"],
        nilai: json["nilai"],
        tglmulai: json["tglmulai"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "idraport": idraport,
        "nilai": nilai,
        "tglmulai": tglmulai,
        "uid": uid,
    };
}
