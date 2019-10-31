// import 'package:adminkursus/src/data/staticdata.dart';
// import 'package:adminkursus/src/model/carisoal_model.dart';
// import 'package:adminkursus/src/provider/newloginprov.dart';
// import 'package:adminkursus/src/provider/searchprov.dart';
// import 'package:adminkursus/src/provider/userrepository.dart';
// import 'package:adminkursus/src/service/realdb_api.dart';
// import 'package:adminkursus/src/ui/admin/daftarsoal.dart';
// import 'package:adminkursus/src/ui/edituser.dart';
// import 'package:adminkursus/src/ui/soalnya_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // class Aapalah extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final userProv = Provider.of<UserRepository>(context);
// //     switch (userProv.dataProfil) {
// //       case DataProfil.Loading:
// //         return Container(
// //           height: double.infinity,
// //           width: double.infinity,
// //           child: Center(child: CircularProgressIndicator()),
// //         );
// //       case DataProfil.BelumLengkap:
// //         return EditUser(userProv.profil);
// //       case DataProfil.Lengkap:
// //         return BerandaPiew();
// //       default:
// //         return Container();

// //     }
// //     // return CariSoalPiew();
// //   }
// // }

// class HomSekrin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final userProv = Provider.of<UserRepository>(context);
//     return Scaffold(
//       appBar: AppBar(backgroundColor:Colors.transparent,elevation: 0,actions: <Widget>[
//         FlatButton(child: Text('admin'),onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (_)=>DaftarSoalAdminPage())),)
//       ],),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.network(userProv.profil.urlimg),
//               Text(userProv.profil.nama),
//               Text(userProv.profil.email),
//               RaisedButton(
//                 child: Text('edit profil'),
//                 onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>EditUser(userProv.profil))),
//               ),
//               RaisedButton(
//                 child: Text('cari Soal'),
//                 onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CariSoalPiew())),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CariSoalPiew extends StatelessWidget {
//   final db = RealdbApi();
//   @override
//   Widget build(BuildContext context) {
//    final userProv = Provider.of<NewLoginProv>(context);
//    final search = Provider.of<SearchProv>(context);
//     return Scaffold(
//       key: UniqueKey(),
//         appBar: AppBar(
//           title: Text('ini appbar'),
//           actions: <Widget>[
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               //Text(search.kelas),
//               // Image.network(userProv.profil.urlimg),
//               //Text(userProv.profil.nama),
//               DropdownButton<String>(
//                 hint: Text('pilih kelas'),
//                 value: search.kelas,
//                 onChanged: (val) {
//                   search.kelas = val;
//                 },
//                 items: StaticData().kelas.map((e) {
//                   return DropdownMenuItem(
//                     value: e,
//                     child: Text(e),
//                   );
//                 }).toList(),
//               ),
//               (search.kelas==null)?Container():DropdownButton(
//                 hint: Text('pilih mapel'),
//                 value: search.mapel,
//                 onChanged: (val){
//                   search.mapel=val;
//                 },
//                 items: StaticData().mapel.map((e){
//                   return DropdownMenuItem(value: e,
//                   child: Text(e),);
//                 }).toList(),
//               ),
//               (search.kelas==null || search.mapel==null)?Container():
//               FutureBuilder<List<CariSoalModel>>(
//                 future: db.cariSoal(search.kelas, search.mapel),
//                 builder: (context,snapsut){
//                   print('apapa'+snapsut.data.toString());
//                   return snapsut.connectionState==ConnectionState.done?snapsut.hasData?
//                   snapsut.data[0].titel==null?
//                   Text('data null'):
//                   Column(
//                     children:snapsut.data.map((val)=> 
//                     ListTile(title: Text(val.titel),
//                     subtitle: Text('Jenis ujian: '+val.jenis),
//                     onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
//                     SoalnyaPage(idSoalnya: val.idsoalnya,)
//                     //SoalnyaPagev2()
//                     )),)).toList(),
//                   ):
//                   Text('hasdata =false'):
//                   Text('data loading');
//                 },
//               )
//             ],
//           ),
//         ),
//     );
//   }
// }
