import 'package:adminkursus/src/data/staticdata.dart';
import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:adminkursus/src/model/carisoal_model.dart';
import 'package:adminkursus/src/provider/jawabanprov.dart';
import 'package:adminkursus/src/provider/newloginprov.dart';
import 'package:adminkursus/src/provider/searchprov.dart';
import 'package:adminkursus/src/provider/soalRepositoryProv.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:adminkursus/src/ui/resultnilai_page.dart';
import 'package:adminkursus/src/ui/soal/newsoalnyapage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CariSoalVAdmin extends StatefulWidget {
  final String sekolah;
  CariSoalVAdmin({this.sekolah});

  @override
  _CariSoalVAdminState createState() => _CariSoalVAdminState();
}

class _CariSoalVAdminState extends State<CariSoalVAdmin> {
  final db = RealdbApi();

  @override
  Widget build(BuildContext context) {
   //final userProv = Provider.of<UserRepository>(context);
   final search = Provider.of<SearchProv>(context);

   Widget _buildButtonTingkat(String titel){
     return Padding(
       padding: const EdgeInsets.all(2.0),
       child: FlatButton(child: Text(titel,style: TextStyle(color: Colors.white),),onPressed: (){search.tingkat=titel;},color: search.tingkat==titel?Colors.blue:Colors.grey,),
     );
   }

    return Scaffold(
      key: UniqueKey(),
        appBar: AppBar(
          title: Text('Pencarian Soal'),
          actions: <Widget>[
           
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildButtonTingkat('SD'),
                      _buildButtonTingkat('SMP'),
                      _buildButtonTingkat('SMA-IPA'),
                      _buildButtonTingkat('SMA-IPS'),
                      ],
                    ),
                  ),
              ),
              //Text(search.kelas),
              // Image.network(userProv.profil.urlimg),
              //Text(userProv.profil.nama),
              (search.tingkat==null)?Container():DropdownButton<String>(
                hint: Text('pilih kelas'),
                value: search.kelas,
                onChanged: (val) {
                  search.kelas = val;
                },
                items: StaticData().kelasV2[search.tingkat].map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
              ),

              (search.kelas==null)?Container():DropdownButton(
                hint: Text('pilih mapel'),
                value: search.mapel,
                onChanged: (val){
                  search.mapel=val;
                },
                items: StaticData().mapelV2[search.tingkat].map((e){
                  return DropdownMenuItem(value: e,
                  child: Text(e),);
                }).toList(),
              ),
              Divider(),
              (search.kelas==null || search.mapel==null)?Container():
              FutureBuilder<List<CariSoalModel>>(
                future: db.cariSoal(search.kelas, search.mapel),
                builder: (context,snapsut){
                  print('apapa'+snapsut.data.toString());
                  return snapsut.connectionState==ConnectionState.done?snapsut.hasData?
                  snapsut.data[0].titel==null?
                  Text('data null'):
                  Column(
                    children:snapsut.data.map((val)=> 
                    
                        ListTile(title: Text(val.titel),
                        subtitle: Text('Jenis ujian: '+val.jenis),
                        onTap: (){
                          return showDialog(context: context,builder: (_)=>AlertDialog(
                            title: Text(val.titel),  
                            content: Text(val.jenis),
                            actions: <Widget>[
                              FlatButton(child: Text('batal'),onPressed: ()=>Navigator.pop(context),),
                              FlatButton(child: Text('unpublish',style: TextStyle(color: Colors.red),),onPressed: ()=>db.unPublishSoal(search.kelas, search.mapel, val.id, val.idsoalnya).then((_)=>Navigator.pop(context)),),
                            ],
                          )).then((_){setState(() {});});
                        },
                        // trailing: SizedBox(width: 40,child: snapshot.connectionState==ConnectionState.done?snapshot.hasData?Text(snapshot.data.nilai.toString()):Container():Container(child: LinearProgressIndicator(),)),
                        // onTap: snapshot.connectionState==ConnectionState.done?snapshot.hasData? 
                        // ()async{
                        //   db.getBankSoalnya(val.idsoalnya).then((onValue){
                        //     var okes = onValue;
                        //     Provider.of<SoalRepositoryProv>(context).banksoal=onValue;
                        //     print("okes"+okes.toString());
                        //     Provider.of<JawabanProv>(context).setAllListJawabanAndPoint(snapshot.data.jawabannye, okes.soalnye);
                        //   }).then((__)=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ResultNilaiPage())));
                        // }
                        // :(){
                        // Provider.of<JawabanProv>(context).clear();
                        // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                        // NewSoalnyaPage(idSoalnya: val.idsoalnya,)));
                        // }:null,
                        )
                    ).toList(),
                  ):
                  Text('hasdata = false'):
                  Container(child:Column(children: <Widget>[Text('data loading'),LinearProgressIndicator()],) );
                },
              )
            ],
          ),
        ),
    );
  }
}
