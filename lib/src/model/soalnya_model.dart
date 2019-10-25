// import 'package:firebase_database/firebase_database.dart';

// class Jawaban {
//     String a;
//     String b;
//     String c;
//     String d;

//     Jawaban({
//         this.a,
//         this.b,
//         this.c,
//         this.d
//     });

//     factory Jawaban.fromJson(Map<String, dynamic> json) => Jawaban(
//         a: json["a"],
//         b: json["b"],
//     );

//     Map<String, dynamic> toJson() => {
//         "a": a,
//         "b": b,
//     };
// }

// class Soalnye {
//     //Jawaban jawaban;
//     Map jawaban;
//     String jawabanbenar;
//     String pembahasan;
//     String pertanyaan;

//     Soalnye({
//         this.jawaban,
//         this.jawabanbenar,
//         this.pembahasan,
//         this.pertanyaan,
//     });

//     factory Soalnye.fromJson(Map<dynamic, dynamic> json) => Soalnye(
//         //jawaban: Jawaban.fromJson(json["jawaban"]),
//         jawaban: json["jawaban"],
//         jawabanbenar: json["jawabanbenar"],
//         pembahasan: json["pembahasan"],
//         pertanyaan: json["pertanyaan"],
//     );

//     Map<String, dynamic> toJson() => {
//         //"jawaban": jawaban.toJson(),
//         "jawaban":jawaban,
//         "jawabanbenar": jawabanbenar,
//         "pembahasan": pembahasan,
//         "pertanyaan": pertanyaan,
//     };
// }

// class SoalnyaModel{
//   String id,kelas,mapel;
//   List<Soalnye> soalnye;
//   SoalnyaModel({
//         this.id,
//         this.kelas,
//         this.mapel,
//         this.soalnye,
//     });

//   factory SoalnyaModel.fromRealDb(DataSnapshot data) => SoalnyaModel(
//         id:data.key,
//         kelas: data.value["kelas"],
//         mapel: data.value["mapel"],
//         soalnye: List<Soalnye>.from(data.value["soalnye"].map((x) => x == null ? null : Soalnye.fromJson(x))),
        
//     );

//      factory SoalnyaModel.fromJson(Map<dynamic,dynamic> data) => SoalnyaModel(
//         kelas: data["kelas"],
//         mapel: data["mapel"],
//         soalnye: List<Soalnye>.from(data["soalnye"].map((x) => x == null ? null : Soalnye.fromJson(x))),
        
//     );

//     Map<String, dynamic> toJson() => {
//         "kelas": kelas,
//         "mapel": mapel,
//         "soalnye": List<dynamic>.from(soalnye.map((x) => x == null ? null : x.toJson())),
        
//     };
// }