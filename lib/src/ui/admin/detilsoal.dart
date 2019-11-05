import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:adminkursus/src/model/carisoal_model.dart';
import 'package:adminkursus/src/provider/buatsoalprov.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:adminkursus/src/ui/admin/setSoalNo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetilSoalAdminPage extends StatefulWidget {
  final BanksoalModel soalCoeg;
  DetilSoalAdminPage({this.soalCoeg});

  @override
  _DetilSoalAdminPageState createState() => _DetilSoalAdminPageState();
}

class _DetilSoalAdminPageState extends State<DetilSoalAdminPage> {

  final RealdbApi api = RealdbApi();

  @override
  void initState() {
    // TODOs: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final bsoal = Provider.of<BuatSoalProv>(context);
    return FutureBuilder<BanksoalModel>(
      future: api.getBankSoalnya(widget.soalCoeg.id),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(title: Text('detail'),actions: <Widget>[
            snapshot.connectionState==ConnectionState.done?
            snapshot.hasData?
            snapshot.data.published==false?
            RaisedButton(child: Text('publish now'),onPressed: ()async{
              var data = snapshot.data;
              api.pushPaketSoal(data.kelas, data.mapel, CariSoalModel(
                idsoalnya: data.id,
                jenis: data.jenis,
                titel: data.titel
              )).then((_)=>setState((){}));
            },):Text('sudah publish'):null:CircularProgressIndicator(),
          ],),
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Text(widget.soalCoeg.titel),
              Text(widget.soalCoeg.kelas+"-"+widget.soalCoeg.mapel+"-"+widget.soalCoeg.jenis),

//==========================================================

             snapshot.connectionState==ConnectionState.done?
             snapshot.hasData?
             snapshot.data.soalnye==null? Center(child: Text('data soal tidak ada'),):
             Container(child: Column(children: List<Widget>.generate(snapshot.data.soalnye.length-1, (int i)=>ListTile(
                title: Text("${i+1} ."+snapshot.data.soalnye[i+1].pertanyaan,maxLines: 2,overflow: TextOverflow.ellipsis,),
                subtitle: Divider(),
                onTap: ()async{
                  bsoal.tsoal=TextEditingController(text: snapshot.data.soalnye[i+1].pertanyaan);
                  bsoal.tjawabanA=TextEditingController(text: snapshot.data.soalnye[i+1].jawaban["A"]);
                  bsoal.tjawabanB=TextEditingController(text: snapshot.data.soalnye[i+1].jawaban["B"]);
                  bsoal.tjawabanC=TextEditingController(text: snapshot.data.soalnye[i+1].jawaban["C"]);
                  bsoal.tjawabanD=TextEditingController(text: snapshot.data.soalnye[i+1].jawaban["D"]);
                  bsoal.jawabanBenar=snapshot.data.soalnye[i+1].jawabanbenar;
                  bsoal.tPembahasan=TextEditingController(text: snapshot.data.soalnye[i+1].pembahasan);
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SetSoalNo(idsoal: snapshot.data.id,nosoal: (i+1).toString(),))).then((onValue)=>setState((){}));
                },
              ),),)):Center(child:Text('hasdata == error')):
             Center(child:CircularProgressIndicator()),

//==========================================================
              // (widget.soalCoeg.soalnye==null)?Container():
              // Container(child: Column(children: List<Widget>.generate(widget.soalCoeg.soalnye.length-1, (int i)=>ListTile(
              //   title: Text("${i+1} ."+widget.soalCoeg.soalnye[i+1].pertanyaan),
              //   subtitle: Divider(),
              //   onTap: ()async{
              //     bsoal.tsoal=TextEditingController(text: widget.soalCoeg.soalnye[i+1].pertanyaan);
              //     bsoal.tjawabanA=TextEditingController(text: widget.soalCoeg.soalnye[i+1].jawaban["A"]);
              //     bsoal.tjawabanB=TextEditingController(text: widget.soalCoeg.soalnye[i+1].jawaban["B"]);
              //     bsoal.tjawabanC=TextEditingController(text: widget.soalCoeg.soalnye[i+1].jawaban["C"]);
              //     bsoal.tjawabanD=TextEditingController(text: widget.soalCoeg.soalnye[i+1].jawaban["D"]);
              //     bsoal.jawabanBenar=widget.soalCoeg.soalnye[i+1].jawabanbenar;
              //     bsoal.tPembahasan=TextEditingController(text: widget.soalCoeg.soalnye[i+1].pembahasan);
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>SetSoalNo(idsoal: widget.soalCoeg.id,nosoal: (i+1).toString(),))).then((onValue)=>setState((){}));
              //   },
              // ),),))
              
            ],),
          ),
          floatingActionButton: snapshot.connectionState==ConnectionState.done?
             snapshot.hasData?
             FloatingActionButton(child: Icon(Icons.add),onPressed: (){
               bsoal.clear();
               Navigator.push(context, MaterialPageRoute(builder: (_)=>SetSoalNo(idsoal: snapshot.data.id,nosoal: snapshot.data.soalnye==null?"1":(snapshot.data.soalnye.length).toString(),)))
               .then((_)=>setState((){}));
             },):null:null,
        );
      }
    );
  }
}