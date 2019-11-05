import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:adminkursus/src/provider/buatsoalprov.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:adminkursus/src/service/systemcall.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:provider/provider.dart';

class SetSoalNo extends StatelessWidget {
  final String nosoal;
  final String idsoal;
  SetSoalNo({this.nosoal,this.idsoal});

  final RealdbApi api = RealdbApi();

  @override
  Widget build(BuildContext context) {
     //final bsoal = Provider.of<BuatSoalProv>(context,listen: false);
    return DefaultTabController(
      length: 2,
          child: WillPopScope(
            onWillPop: ()async{
             return showDialog<bool>(context: context,builder: (_)=>AlertDialog(
          title: Text('Soal Belum disimpan ?'),
          //content: Text(''),
          actions: <Widget>[
            FlatButton(child: Text('batal',style: TextStyle(color: Colors.blue),),onPressed: (){
              return Navigator.pop(_,false);
             
              
            },),
            FlatButton(child: Text('Exit Ok',style: TextStyle(color: Colors.red),),onPressed: (){
              return Navigator.pop(_,true);
              
            },),
          ],
        )).then((onValue)=>onValue??false);
            },
            child: Scaffold(
        appBar: AppBar(title: Text("soal no: $nosoal"),
        bottom: TabBar(onTap: (i)=>SystemChannels.textInput.invokeMethod('TextInput.hide'),
            tabs: <Widget>[
            Tab(text: "Edit",),Tab(text: "Preview",),
        ],),),
        body: TabBarView(
            children: <Widget>[
            TabEditCoeg(nosoal: nosoal,idsoal: idsoal,),
            TabPreviewCoeg()
        ],),
      ),
          ),
    );
  }
}


class TabEditCoeg extends StatelessWidget {
  final String nosoal;
  final String idsoal;
  TabEditCoeg({this.nosoal,this.idsoal});


  final _formkey = GlobalKey<FormState>();
  final RealdbApi api = RealdbApi();
  @override
  Widget build(BuildContext context) {
    final bsoal = Provider.of<BuatSoalProv>(context);
    return SingleChildScrollView(child: Form( key: _formkey,
          child: Column(children: <Widget>[
             TextFormField(
                  controller: bsoal.tsoal,
                  decoration: InputDecoration(labelText: 'isi soal'),
                  validator: (i)=>i.length>=1?null:"tak bolehkosong",
                  minLines: 4,
                  maxLines: 5,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: bsoal.tjawabanA,
                   validator: (i)=>i.length>=1?null:"tak bolehkosong",
                  decoration: InputDecoration(labelText: 'Pilihan A:'),
                ),
                TextFormField( validator: (i)=>i.length>=1?null:"tak bolehkosong",
                  controller: bsoal.tjawabanB,
                  decoration: InputDecoration(labelText: 'Pilihan B:'),
                ),
                TextFormField( validator: (i)=>i.length>=1?null:"tak bolehkosong",
                  controller: bsoal.tjawabanC,
                  decoration: InputDecoration(labelText: 'Pilihan C:'),
                ),
                TextFormField( validator: (i)=>i.length>=1?null:"tak bolehkosong",
                  controller: bsoal.tjawabanD,
                  decoration: InputDecoration(labelText: 'Pilihan D:'),
                ),
                Divider(),
                Text('jawaban benar:'),
                DropdownButtonFormField<String>(
                  validator: (i)=>i.length>=1?null:"tak bolehkosong",
                  hint: Text('pilih Jawaban benar'),
                  value: bsoal.jawabanBenar,
                  onChanged: (val) {
                    bsoal.jawabanBenar = val;
                  },
                  items: ["A","B","C","D"].map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                ),
                TextFormField( validator: (i)=>i.length>=1?null:"tak bolehkosong",
                  controller: bsoal.tPembahasan,
                  decoration: InputDecoration(labelText: 'Pembahasan :'),
                ),
                RaisedButton(child: Text('submit'),onPressed: ()async{
                  if (_formkey.currentState.validate()){
                    return api.setSoal(idsoal, nosoal, Soalnye(
                    pertanyaan: SystemCall.encodetoBase64(bsoal.tsoal.text),
                    jawaban: {
                      "A":SystemCall.encodetoBase64(bsoal.tjawabanA.text),
                      "B":SystemCall.encodetoBase64(bsoal.tjawabanB.text),
                      "C":SystemCall.encodetoBase64(bsoal.tjawabanC.text),
                      "D":SystemCall.encodetoBase64(bsoal.tjawabanD.text),
                    },
                    jawabanbenar: bsoal.jawabanBenar,
                    pembahasan: SystemCall.encodetoBase64(bsoal.tPembahasan.text)
                  )).then((_){
                    bsoal.clear();
                    Navigator.pop(context);
                  });
                  }
                  
                },)
          ],),
    ),);
  }
}

class TabPreviewCoeg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bsoal = Provider.of<BuatSoalProv>(context);
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        TeXView(teXHTML: bsoal.tsoal.text,),
        Card(child: ListTile(leading: Text('A'),title: TeXView(teXHTML: bsoal.tjawabanA.text,),)),
        Card(child: ListTile(leading: Text('B'),title: TeXView(teXHTML: bsoal.tjawabanB.text,),)),
        Card(child: ListTile(leading: Text('C'),title: TeXView(teXHTML: bsoal.tjawabanC.text,),)),
        Card(child: ListTile(leading: Text('D'),title: TeXView(teXHTML: bsoal.tjawabanD.text,),)),
        SizedBox(height: 20,),

      ],),
    );
  }
}



// class BuatPaketSoalPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //final search = Provider.of<SearchProv>(context);
//     final bsoal = Provider.of<BuatSoalProv>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('buat soal'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             DropdownButton<String>(
//               hint: Text('pilih kelas'),
//               value: bsoal.kelas,
//               onChanged: (val) {
//                 bsoal.kelas = val;
//               },
//               items: StaticData().kelas.map((e) {
//                 return DropdownMenuItem(
//                   value: e,
//                   child: Text(e),
//                 );
//               }).toList(),
//             ),
//             DropdownButton(
//               hint: Text('pilih mapel'),
//               value: bsoal.mapel,
//               onChanged: (val) {
//                 bsoal.mapel = val;
//               },
//               items: StaticData().mapel.map((e) {
//                 return DropdownMenuItem(
//                   value: e,
//                   child: Text(e),
//                 );
//               }).toList(),
//             ),
//             TextFormField(
//               controller: bsoal.ttitel,
//               decoration: InputDecoration(labelText: 'titel soal'),
//             ),
//             TextFormField(
//               controller: bsoal.tsoal,
//               decoration: InputDecoration(labelText: 'isi soal'),
//               minLines: 4,
//               maxLines: 5,
//             ),
//             Divider(),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: bsoal.tjawabanA,
//               decoration: InputDecoration(labelText: 'Pilihan A:'),
//             ),
//             TextFormField(
//               controller: bsoal.tjawabanB,
//               decoration: InputDecoration(labelText: 'Pilihan B:'),
//             ),
//             TextFormField(
//               controller: bsoal.tjawabanC,
//               decoration: InputDecoration(labelText: 'Pilihan C:'),
//             ),
//             TextFormField(
//               controller: bsoal.tjawabanD,
//               decoration: InputDecoration(labelText: 'Pilihan D:'),
//             ),
//             DropdownButton<String>(
//               hint: Text('Jawaban benar'),
//               value: bsoal.jawabanBenar,
//               onChanged: (val) {
//                 bsoal.jawabanBenar = val;
//               },
//               items: ["A","B","C","D"].map((e) {
//                 return DropdownMenuItem(
//                   value: e,
//                   child: Text(e),
//                 );
//               }).toList(),
//             ),
//             // RaisedButton(
//             //   child: Text('submit'),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
