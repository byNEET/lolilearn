import 'package:adminkursus/src/data/staticdata.dart';
import 'package:adminkursus/src/provider/buatPaketSoalProv.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
//import 'package:adminkursus/src/provider/searchprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuatPaketSoalPage extends StatelessWidget {
  final RealdbApi api = RealdbApi();
  @override
  Widget build(BuildContext context) {
    //final search = Provider.of<SearchProv>(context);
    final bsoal = Provider.of<BuatPaketSoalProv>(context); 
    return Scaffold(
      appBar: AppBar(
        title: Text('buat Paket soal'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              hint: Text('pilih kelas'),
              value: bsoal.kelas,
              onChanged: (val) {
                bsoal.kelas = val;
              },
              items: StaticData().kelas.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
            ),
            DropdownButton(
              hint: Text('pilih mapel'),
              value: bsoal.mapel,
              onChanged: (val) {
                bsoal.mapel = val;
              },
              items: StaticData().mapel.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
            ),
            DropdownButton(
              hint: Text('pilih Jenis soal'),
              value: bsoal.jenis,
              onChanged: (val) {
                bsoal.jenis = val;
              },
              items: StaticData().jenis.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
            ),
            TextFormField(
              controller: bsoal.ttitel,
              decoration: InputDecoration(labelText: 'titel soal'),
            ),
           
             RaisedButton(
               child: Text('submit'),
               onPressed: ()async{
                 api.buatPaketSoal({
                   "kelas": bsoal.kelas,
                   "mapel": bsoal.mapel,
                   "jenis": bsoal.jenis,
                   "titel": bsoal.ttitel.text,
                   "published":false
                 }).then((_){
                   bsoal.clear();
                   Navigator.pop(context);
                 });
               },
             )
          ],
        ),
      ),
    );
  }
}
