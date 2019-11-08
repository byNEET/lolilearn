import 'package:adminkursus/src/data/staticdata.dart';
import 'package:adminkursus/src/provider/buatPaketSoalProv.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
//import 'package:adminkursus/src/provider/searchprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuatPaketSoalPage extends StatefulWidget {
  @override
  _BuatPaketSoalPageState createState() => _BuatPaketSoalPageState();
}

class _BuatPaketSoalPageState extends State<BuatPaketSoalPage> {
  final RealdbApi api = RealdbApi();
  bool isloading;
  @override
  void initState() {
    // TODsO: implement initState
    super.initState();
    isloading=false;
  }
  @override
  Widget build(BuildContext context) {
    //final search = Provider.of<SearchProv>(context);
    final bsoal = Provider.of<BuatPaketSoalProv>(context); 

    Widget _buildButtonTingkat(String titel){
     return Padding(
       padding: const EdgeInsets.all(2.0),
       child: FlatButton(child: Text(titel,style: TextStyle(color: Colors.white),),onPressed: (){bsoal.tingkat=titel;},color: bsoal.tingkat==titel?Colors.blue:Colors.grey,),
     );
   }


    return Scaffold(
      appBar: AppBar(
        title: Text('buat Paket soal'),
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


           (bsoal.tingkat==null)?Container():DropdownButton<String>(
                hint: Text('pilih kelas'),
                value: bsoal.kelas,
                onChanged: (val) {
                  bsoal.kelas = val;
                },
                items: StaticData().kelasV2[bsoal.tingkat].map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
              ),

              (bsoal.kelas==null)?Container():DropdownButton(
                hint: Text('pilih mapel'),
                value: bsoal.mapel,
                onChanged: (val){
                  bsoal.mapel=val;
                },
                items: StaticData().mapelV2[bsoal.tingkat].map((e){
                  return DropdownMenuItem(value: e,
                  child: Text(e),);
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
               child: isloading?CircularProgressIndicator():Text('submit'),
               onPressed: isloading?null:()async{
                 setState(() {
                  isloading =true; 
                 });
                 api.ngetesBuatSoalLangsungPushtapiFalse({
                   "tingkat":bsoal.tingkat,
                   "kelas": bsoal.kelas,
                   "mapel": bsoal.mapel,
                   "jenis": bsoal.jenis,
                   "titel": bsoal.ttitel.text,
                   "published":false,
                   "createat":DateTime.now().toIso8601String()
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
