import 'package:adminkursus/src/model/banksoall_quicktype.dart';
import 'package:adminkursus/src/service/realdb_api.dart';
import 'package:adminkursus/src/ui/admin/buatPaketsoal.dart';
import 'package:adminkursus/src/ui/admin/detilsoal.dart';
import 'package:flutter/material.dart';

class DaftarSoalAdminPage extends StatefulWidget {
  @override
  _DaftarSoalAdminPageState createState() => _DaftarSoalAdminPageState();
}

class _DaftarSoalAdminPageState extends State<DaftarSoalAdminPage> {
  final RealdbApi api = RealdbApi();

  @override
  void initState() {
    // TODOs: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) { 
              return Scaffold(
                appBar: AppBar(
                  title: Text('daftar soal'),
                ),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BuatPaketSoalPage())).then((_)=>setState((){})),
                ),
                body: FutureBuilder<List<BanksoalModel>>(
                  future: api.getListSoal(),
                  builder: (context, snapshot) {
                    
                   if (snapshot.connectionState == ConnectionState.done){
                     if (snapshot.hasData){
                       var data = snapshot.data;
                        return SingleChildScrollView(
                      child: Column(
                        children: data
                            .map((f) => Container(
                                  child: ListTile(
                                    title: Text(f.titel),
                                    subtitle: Text(f.kelas +" : " +f.mapel +" : " +f.jenis),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DetilSoalAdminPage(
                                                  soalCoeg: f,
                                                ))).then((onValue)=>setState((){})),
                                    trailing: IconButton(icon: Icon(Icons.delete_forever),onPressed: ()=>showDialog(context: context,builder: (_)=>AlertDialog(title: Text('Hapus paket Soal ?'),actions: <Widget>[
                                      FlatButton(child: Text('Batal'),onPressed: ()=>Navigator.pop(context),),
                                      FlatButton(child: Text('Hapus',style: TextStyle(color: Colors.red),),onPressed: ()=>api.hapusPaketSoal(f).then((_)=>Navigator.pop(context)),),
                                    ],)).then((_){setState(() {});}),),
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                     }else {return Center(child: Text('hasdata == false'),);}
                   }else{return Center(child: CircularProgressIndicator(),);}
                  }
                ),
              );
  }
}

class BodySeparateByPublished extends StatelessWidget {
  final List<BanksoalModel> data;
  final bool publisaed;
  BodySeparateByPublished({@required this.data,this.publisaed});
  @override
  Widget build(BuildContext context) {
    var okesihp = (publisaed==null)?data:data.where((i)=>i.published==publisaed).toList();
    
    return Container(
      child: SingleChildScrollView(child: Column(children: okesihp.map((f)=>Container()).toList(),),

      ),
    );
  }
}

class FloatingiconAdd extends StatefulWidget {
  @override
  _FloatingiconAddState createState() => _FloatingiconAddState();
}

class _FloatingiconAddState extends State<FloatingiconAdd> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BuatPaketSoalPage())).then((_)=>setState((){})),
                );
  }
}