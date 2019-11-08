import 'package:adminkursus/src/data/staticdata.dart';
import 'package:adminkursus/src/model/materi_model.dart';
import 'package:adminkursus/src/provider/materiprov.dart';
import 'package:adminkursus/src/ui/admin/buatmateri_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListMateriAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materiProv = Provider.of<MateriProv>(context);
     Widget _buildButtonTingkat(String titel){
     return Padding(
       padding: const EdgeInsets.all(2.0),
       child: FlatButton(child: Text(titel,style: TextStyle(color: Colors.white),),onPressed: (){materiProv.tingkat =titel;},color: materiProv.tingkat==titel?Colors.blue:Colors.grey,),
     );
   }
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        materiProv.clearnonotif();
        Navigator.push(context, MaterialPageRoute(builder: (_)=>BuatMateriPage()));
      },),
      appBar: AppBar(centerTitle: true,title: Text('Materi'),),
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
              (materiProv.tingkat==null)?Container():DropdownButton<String>(
                hint: Text('pilih mapel'),
                value: materiProv.mapel,
                onChanged: (val) {
                  materiProv.mapel = val;
                },items: StaticData().mapelV2[materiProv.tingkat].map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                ),
            (materiProv.tingkat==null||materiProv.mapel==null)?Container():
            FutureBuilder<List<MateriModel>>(
              future: materiProv.getListmateriRepoAdmin(materiProv.tingkat, materiProv.mapel),
              builder: (context, snapshot) {
                if (snapshot.connectionState==ConnectionState.done) {
                 if (snapshot.hasData){
                   var oke = snapshot.data;
                   return Container(child: Column(children: 
                   oke.map((data)=> Card(child: ListTile(
                   trailing: Container(width: 100,color: data.published==true?Colors.pinkAccent: Colors.lightBlue,child: Center(
                     child: data.published==true
                     ?FlatButton(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Icon(Icons.close,color: Colors.white),
                         Text('UNPUBLISH',style: TextStyle(color: Colors.white),),
                       ],
                     ),onPressed: (){},)
                     :FlatButton(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Icon(Icons.send,color: Colors.white,),
                         Text('PUBLISH',style: TextStyle(color: Colors.white)),
                       ],
                     ),onPressed: (){},),
                   ),
                   ),
                    title: Text(data.titel),
                    subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(data.mapel??""+" - "+data.tingkat??""+" "+data.kelas??""),
                        data.published?
                            Text('sudah Publish',style: TextStyle(color: Colors.green),):
                            Text('belum Publish (draft)',style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    onTap: (){
                      materiProv.tingkat = data.tingkat;
                      materiProv.mapel = data.mapel;
                      materiProv.kelas = data.kelas;
                      materiProv.ttitel = TextEditingController(text: data.titel);
                      materiProv.tisi = TextEditingController(text: data.isimateri);
                      return Navigator.push(context, MaterialPageRoute(builder: (_)=>BuatMateriPage(materi: data,)));
                    },),)
                   ).toList()
                   ,),);
                   
                  
                }else{return Center(child: Text('tidak ada data'));}
                
              }else{return Center(child: CircularProgressIndicator());}
              }
            ),
          ],
        ),
      ),
    );
  }
}