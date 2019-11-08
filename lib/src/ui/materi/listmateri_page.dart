import 'package:adminkursus/src/data/staticdata.dart';
import 'package:adminkursus/src/model/materi_model.dart';
import 'package:adminkursus/src/provider/materiprov.dart';
import 'package:adminkursus/src/ui/materi/detilmateri_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListMateriPage extends StatelessWidget {
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
              future: materiProv.getListmateriRepo(materiProv.tingkat, materiProv.mapel),
              builder: (context, snapshot) {
                if (snapshot.connectionState==ConnectionState.done) {
                 if (snapshot.hasData){
                   var oke = snapshot.data;
                   return Container(child: Column(children: 
                   oke.map((data)=> Card(child: ListTile(
                    title: Text(data.titel),
                    subtitle: Text(data.mapel+" - "+data.tingkat+" "+data.kelas),
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>DetilMateri(materi: data,))),),)
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