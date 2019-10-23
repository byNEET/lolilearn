import 'package:adminkursus/src/model/soalnya_model.dart';
import 'package:adminkursus/src/provider/jawabanprov.dart';
import 'package:adminkursus/src/provider/userrepository.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:adminkursus/src/ui/resultnilai_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoalnyaPage extends StatelessWidget {
  final String idSoalnya;
  SoalnyaPage({this.idSoalnya});

  final RealdbApi db = RealdbApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SoalnyaModel>(
          future: db.getSoalnya('idsoal'),
          builder: (context,snapsut){
            print(snapsut.data);
            if ((snapsut.connectionState == ConnectionState.done)) {
              return (snapsut.hasData)?

            DefaultTabController(
             // key: GlobalKey(),
             key: UniqueKey(),
              initialIndex: 0,
            length: snapsut.data.soalnye.length-1,
                      child: Scaffold(
                       key: UniqueKey(),
        appBar: AppBar(title: Text(snapsut.data.mapel+snapsut.data.kelas),actions: <Widget>[
          TombolSudahdiUjungKananAppbar(jumlahsoal: snapsut.data.soalnye.length-1,)
        ],
        bottom: TabBar(
          isScrollable: true,
            tabs: List<int>.generate(snapsut.data.soalnye.length-1, 
            //(i)=>i+1).map((f)=>
            (i)=>i+1).map((f)=>
            TabItemWiget(f: f,)
            ).toList(),
        ),),
        body: TabBarView(
          key: UniqueKey(),
          children:List<Widget>.generate(snapsut.data.soalnye.length-1, (int index){
            if (snapsut.data.soalnye[index+1]!=null){
              return TabSoalBody(soalnye: snapsut.data.soalnye,index: index,);
           }else{
              return Container(child: Text('data null: be intro, '),);
            }
          })
        ),
      ),
          ):Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Center(child: Text('something wrong :('),),
              );
            } else {
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Center(child: CircularProgressIndicator(),),
              );
            }
          },
    );
  }
}

class TombolSudahdiUjungKananAppbar extends StatelessWidget {
  final int jumlahsoal;
  TombolSudahdiUjungKananAppbar({this.jumlahsoal});
  final RealdbApi api = RealdbApi();

  void _submitJawaban(n,uid,nilai,context)async{
    api.simpanJawaban(n, uid, nilai).then((_){
      Navigator.push(context, MaterialPageRoute(builder: (__)=>ResultNilaiPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    final jawabanProv = Provider.of<JawabanProv>(context);
    final user = Provider.of<UserRepository>(context);
    var data = jawabanProv.listJawaban;
    var nilai = jawabanProv.nilai;
    return Container(
      child: RaisedButton(
        child: Text('Selesai'),
        onPressed: (data.length == jumlahsoal)  ? ()async=>_submitJawaban(data,user.user.uid,nilai,context):null,
      ),
    );
  }
}

class TabItemWiget extends StatelessWidget {
  final int f;
  TabItemWiget({this.f});
  @override
  Widget build(BuildContext context) {
    final jawabanProv = Provider.of<JawabanProv>(context);
    return Tab(
              child: Text(f.toString(),style: TextStyle(color: (jawabanProv.listJawaban[f.toString()]==null)?Colors.black:Colors.red),),
            );
  }
}


class TabSoalBody extends StatelessWidget {
  final List<Soalnye> soalnye;
  final int index;
  TabSoalBody({Key key,this.soalnye,this.index}):super(key:key);
  @override
  Widget build(BuildContext context) {
     final jawabanProv = Provider.of<JawabanProv>(context);
    return Container(
              key: UniqueKey(),
              child: Column(children: <Widget>[
              Text("${index+1}. ${soalnye[index+1].pertanyaan}"),
              Container(child: Column(children: ["A","B","C","D"].map((f)=>Card(
                child: ListTile(leading: Container(child: Text('$f.'),color: jawabanProv.listJawaban[(index+1).toString()]==f?Colors.red:Colors.green,),
                title: Text(soalnye[index+1].jawaban[f]),
                onTap: ()=>jawabanProv.addListJawabanAndPoint((index+1).toString(), f,soalnye[index+1].jawabanbenar)),
              )).toList(),),)
            ],),);
  }
}























// class SoalnyaPagev2 extends StatelessWidget {
//   final RealdbApi db = RealdbApi();
//   @override
//   Widget build(BuildContext context) {
//      final jawabanProv = Provider.of<JawabanProv>(context);
//     return FutureBuilder<SoalnyaModel>(
//       future: db.getSoalnya('idsoal'),
//       builder: (context, snapsut) {
//         return Scaffold(
//           appBar: AppBar(title: Text('asw'),),
//           body: SingleChildScrollView(
//             child: Column(children: List<Widget>.generate(snapsut.data.soalnye.length-1, (int index){
//             if (snapsut.data.soalnye[index]!=null){
//             return Container(
//               key: UniqueKey(),
//               child: Column(children: <Widget>[
//               Text("$index. ${snapsut.data.soalnye[index].pertanyaan}"),
//               Container(child: Column(children: ["A","B","C","D"].map((f)=>Card(
//                 child: ListTile(leading: Container(child: Text('$f.'),color: jawabanProv.listJawaban[index.toString()]==f?Colors.red:Colors.black,),
//                 title: Text(snapsut.data.soalnye[index].jawaban[f]),
//                 onTap: ()=>jawabanProv.listJawaban[index.toString()]=f,),
//               )).toList(),),)
//             ],),);}else{
              
//             }
//           }) ,),
//           ),
//         );
//       }
//     );
//   }
// }