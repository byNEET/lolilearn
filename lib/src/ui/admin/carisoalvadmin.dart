import 'package:adminkursus/src/data/staticdata.dart';
import 'package:adminkursus/src/model/listbanksoal_model.dart';
import 'package:adminkursus/src/provider/searchprov.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:adminkursus/src/ui/admin/buatPaketsoal.dart';
import 'package:adminkursus/src/ui/admin/detilsoal.dart';
import 'package:adminkursus/src/ui/admin/listnilai_page.dart';
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
   Widget _builButtonindialog({String titel, VoidCallback ontap,Color color}){
     return Padding(padding: EdgeInsets.all(4),
     child: FlatButton(color: Colors.blueGrey,child: Text(titel,style: TextStyle(color: Colors.white),),onPressed: ontap,),);
   }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_) => BuatPaketSoalPage())).then((_)=>setState((){})),
                ),
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
              FutureBuilder<List<Listbanksoal>>(
                future: db.cariSoalAdmin(search.kelas, search.mapel),
                builder: (context,snapsut){
                  print('apapa'+snapsut.data.toString());
                  return snapsut.connectionState==ConnectionState.done?snapsut.hasData?
                  snapsut.data[0].titel==null?
                  Text('data null'):
                  Column(
                    children:snapsut.data.map((val)=> 
                    
                        ListTile(title: Text(val.titel),
                        subtitle: Column(
                          children: <Widget>[
                            Text('Jenis soal: '+val.jenis),
                            val.published?
                            Text('sudah Publish',style: TextStyle(color: Colors.green),):
                            Text('belum Publish (draft)',style: TextStyle(color: Colors.red),)
                          ],
                        ),
                        onTap: (){
                          return showDialog(context: context,builder: (_)=>AlertDialog(
                            title: Text(val.titel),  
                            content: Column(mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(val.jenis),
                                Divider(),
                                _builButtonindialog(titel: 'Edit soal',ontap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>DetilSoalAdminPage(soalCoeg: val,)))),
                                val.published?
                                _builButtonindialog(titel: 'Unpublish',ontap: ()=>db.unPublishSoalV2(val.kelas, val.mapel, val.id).then((_)=>Navigator.pop(context))):
                                _builButtonindialog(titel: 'publish',ontap: ()=>db.publishSoaltrueV2(kelas:val.kelas, mapel:val.mapel, idsoal:val.id).then((_)=>Navigator.pop(context))),
                                _builButtonindialog(titel: "List Nilai", ontap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ListNilaiPage(dsoal: val,))))
                              ],
                            ),
                            actions: <Widget>[
                              
                              FlatButton(child: Text('Hapus! (Danger)',style: TextStyle(color: Colors.red),),onPressed: ()=>showDialog(context: _,builder: (__)=>AlertDialog(
                                title: Text('yakin hapus ?'),
                                content: Text('setelah hapus tidak bisa dikembalikan lagi !!'),
                                actions: <Widget>[
                                  FlatButton(child: Text('batal'),onPressed: ()=>Navigator.pop(context),),
                                  FlatButton(child: Text('Oke Hapus',style: TextStyle(color: Colors.red)),onPressed: ()=>db.hapusPaketSoal(val).then((_)=>Navigator.pop(context)),),
                                  
                                ],
                              )).then((_)=>Navigator.pop(context)),),
                              FlatButton(child: Text('batal'),onPressed: ()=>Navigator.pop(context),),
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
