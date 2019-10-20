import 'package:adminkursus/src/model/soalnya_model.dart';
import 'package:adminkursus/src/provider/jawabanprov.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoalnyaPage extends StatelessWidget {
  final String idSoalnya;
  SoalnyaPage({this.idSoalnya});

  final RealdbApi db = RealdbApi();

  @override
  Widget build(BuildContext context) {
    final jawabanProv = Provider.of<JawabanProv>(context);

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
            length: snapsut.data.soalnye.length,
                      child: Scaffold(
                       key: UniqueKey(),
        appBar: AppBar(title: Text(snapsut.data.mapel+snapsut.data.kelas),
        bottom: TabBar(
          isScrollable: true,
            tabs: List<int>.generate(snapsut.data.soalnye.length, 
            //(i)=>i+1).map((f)=>
            (i)=>i).map((f)=>
            Tab(
              child: Text(f.toString(),style: TextStyle(color: (jawabanProv.listJawaban[f.toString()]==null)?Colors.black:Colors.red),),
            )).toList(),
        ),),
        body: TabBarView(
          key: UniqueKey(),
          children:List<Widget>.generate(snapsut.data.soalnye.length, (int index){
            if (snapsut.data.soalnye[index]!=null){
            return Container(
              key: UniqueKey(),
              child: Column(children: <Widget>[
              Text("$index. ${snapsut.data.soalnye[index].pertanyaan}"),
              Container(child: Column(children: ["A","B","C","D"].map((f)=>Card(
                child: ListTile(leading: Container(child: Text('$f.'),color: jawabanProv.listJawaban[index.toString()]==f?Colors.red:Colors.green,),
                title: Text(snapsut.data.soalnye[index].jawaban[f]),
                onTap: ()=>jawabanProv.addListJawaban(index.toString(), f)),
              )).toList(),),)
            ],),);}else{
              return Container(child: Text('data null: be intro, '),);
            }
          })
        ),
      ),
          ):Container();
            } else {
              return Container();
            }
          },
    );
  }
}

class SoalnyaPagev2 extends StatelessWidget {
  final RealdbApi db = RealdbApi();
  @override
  Widget build(BuildContext context) {
     final jawabanProv = Provider.of<JawabanProv>(context);
    return FutureBuilder<SoalnyaModel>(
      future: db.getSoalnya('idsoal'),
      builder: (context, snapsut) {
        return Scaffold(
          appBar: AppBar(title: Text('asw'),),
          body: SingleChildScrollView(
            child: Column(children: List<Widget>.generate(snapsut.data.soalnye.length-1, (int index){
            if (snapsut.data.soalnye[index]!=null){
            return Container(
              key: UniqueKey(),
              child: Column(children: <Widget>[
              Text("$index. ${snapsut.data.soalnye[index].pertanyaan}"),
              Container(child: Column(children: ["A","B","C","D"].map((f)=>Card(
                child: ListTile(leading: Container(child: Text('$f.'),color: jawabanProv.listJawaban[index.toString()]==f?Colors.red:Colors.black,),
                title: Text(snapsut.data.soalnye[index].jawaban[f]),
                onTap: ()=>jawabanProv.listJawaban[index.toString()]=f,),
              )).toList(),),)
            ],),);}else{
              
            }
          }) ,),
          ),
        );
      }
    );
  }
}