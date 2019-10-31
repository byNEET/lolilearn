import 'package:adminkursus/src/provider/jawabanprov.dart';
import 'package:adminkursus/src/provider/soalRepositoryProv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultNilaiPage extends StatelessWidget {
  final int nilai;
  ResultNilaiPage({this.nilai});
  @override
  Widget build(BuildContext context) {
    final jawabanProv = Provider.of<JawabanProv>(context);
    final soalProv = Provider.of<SoalRepositoryProv>(context);
    return Scaffold(
      appBar: AppBar(title: Text('result'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Text("nilai: ${jawabanProv.countNilai()}"),
              Divider(),
              Text('pembahasan :'),
              Container(child: Column(children: List<Widget>.generate(soalProv.banksoal.soalnye.length-1, (index){
                var soalnye = soalProv.banksoal.soalnye[index+1];
                return Container(
                child: ListTile(title: Text("${index+1}. "+soalnye.pertanyaan),
                subtitle: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text(">> "+soalnye.jawaban[soalnye.jawabanbenar]),
                    Text("jawaban benar: ${soalnye.jawabanbenar}, jawaban kamu: ${jawabanProv.listJawaban[(index+1).toString()]}, poin: ${jawabanProv.listPoint[(index+1).toString()]}"),
                   
                  ],
                ),),
              );
              })),),
              Divider(),
              // Text("nilai = (sum(poin)/jumlah soal)x100"),
              // Text("${jawabanProv.countNilai()/soalProv.banksoal.soalnye.length-1}"),
              
              SizedBox(height: 50,),           
              RaisedButton(child: Text('OK'),
              onPressed: ()=>Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}