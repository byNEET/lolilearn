import 'package:adminkursus/src/data/staticdata.dart';
import 'package:adminkursus/src/provider/buatsoalprov.dart';
//import 'package:adminkursus/src/provider/searchprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuatSoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final search = Provider.of<SearchProv>(context);
    final bsoal = Provider.of<BuatSoalProv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('buat soal'),
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
            TextFormField(
              controller: bsoal.ttitel,
              decoration: InputDecoration(labelText: 'titel soal'),
            ),
            TextFormField(
              controller: bsoal.tsoal,
              decoration: InputDecoration(labelText: 'isi soal'),
              minLines: 4,
              maxLines: 5,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: bsoal.tjawabanA,
              decoration: InputDecoration(labelText: 'Pilihan A:'),
            ),
            TextFormField(
              controller: bsoal.tjawabanB,
              decoration: InputDecoration(labelText: 'Pilihan B:'),
            ),
            TextFormField(
              controller: bsoal.tjawabanC,
              decoration: InputDecoration(labelText: 'Pilihan C:'),
            ),
            TextFormField(
              controller: bsoal.tjawabanD,
              decoration: InputDecoration(labelText: 'Pilihan D:'),
            ),
            DropdownButton<String>(
              hint: Text('Jawaban benar'),
              value: bsoal.jawabanBenar,
              onChanged: (val) {
                bsoal.kelas = val;
              },
              items: ["A","B","C","D"].map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
            ),
            RaisedButton(
              child: Text('submit'),
            )
          ],
        ),
      ),
    );
  }
}
